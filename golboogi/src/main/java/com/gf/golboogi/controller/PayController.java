package com.gf.golboogi.controller;



import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gf.golboogi.repository.BookingDao;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.repository.MemberDao;
import com.gf.golboogi.repository.PackageDao;
import com.gf.golboogi.repository.PackageReserveDao;
import com.gf.golboogi.repository.PaymentDao;
import com.gf.golboogi.repository.StayDao;
import com.gf.golboogi.entity.PaymentDto;
import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.entity.BookingDto;
import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.entity.PackageReserveDto;
import com.gf.golboogi.entity.PaymentDetailDto;
import com.gf.golboogi.service.KakaoPayService;
import com.gf.golboogi.service.PaymentService;
import com.gf.golboogi.vo.BookingPurchaseVO;
import com.gf.golboogi.vo.KakaoPayApproveRequestVO;
import com.gf.golboogi.vo.KakaoPayApproveResponseVO;
import com.gf.golboogi.vo.KakaoPayCancelRequestVO;
import com.gf.golboogi.vo.KakaoPayCancelResponseVO;
import com.gf.golboogi.vo.KakaoPayReadyRequestVO;
import com.gf.golboogi.vo.KakaoPayReadyResponseVO;
import com.gf.golboogi.vo.PackagePurchaseVO;
import com.gf.golboogi.vo.PackageVO;
import com.gf.golboogi.vo.PurchaseVO;

import lombok.extern.log4j.Log4j2;

@Controller
public class PayController {

//	@Autowired
//	private PackageVO packageVo;
	
	@Autowired
	private StayDao stayDao;
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
	private PaymentDao paymentDao;

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BookingDao bookingDao;
	
	@Autowired
	private PackageDao packageDao;
	
	@Autowired
	private PackageReserveDao packageReserveDao;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private GolfFieldDao golfFieldDao;
	

	
    @GetMapping("package/package_purchase")
		public String pay1Get(@RequestParam int packageNo, Model model,MemberDto memberDto, HttpSession session ) {
    	PackageVO packageVo = packageDao.one(packageNo);	
    	   
    	    String memberId = (String) session.getAttribute("login");
    	    memberDto = memberDao.info(memberId); 
    	    
    	    //예약자 이름. 이메일. 번호 가져오기 
    		String memberName = memberDto.getMemberName();
    		String memberEmail = memberDto.getMemberEmail();
    		String memberPhone = memberDto.getMemberPhone();   	    
    	    
    	    model.addAttribute("memberDto", memberDto );
    	    model.addAttribute("packageVo", packageVo);
			return"package/package_purchase";

    }

	
	@PostMapping("package/package_purchase")
	public String pay1Purchase(
				Model model,@ModelAttribute PackageReserveDto packageReserveDto,
				HttpSession session
			) throws URISyntaxException {
		System.out.println(packageReserveDto);
		
		PackageVO packageVo = packageDao.one(packageReserveDto.getPackageNo());
		//상품이 없다면 결제가 진행되지 않도록 처리
				if(packageVo == null) {
					return "redirect:package_purchase";
				}
				
		//결제 준비(ready) 요청을 진행
		int totalAmount= (packageVo.getStayDto().getStayPrice()) + (packageVo.getFieldDto().getFieldGreenfee())*4;
		int paymentNo = paymentDao.sequence();
		KakaoPayReadyRequestVO requestVO = 
									KakaoPayReadyRequestVO.builder()
												.partner_order_id(String.valueOf(paymentNo))
												.partner_user_id(session.getId())
												.item_name("골북이투어결제")
												.quantity(1)
												.total_amount(totalAmount)
											.build();
		KakaoPayReadyResponseVO responseVO = kakaoPayService.ready(requestVO);
		
		//결제성공 페이지에서 승인요청을 보내기 위해 알아야할 데이터 3개를 세션에 임시로 추가한다
		//-> 결제가 성공할지 실패할지 취소될지 모르기 때문에 모든 경우에 추가한 데이터를 지워야 한다
		session.setAttribute("pay", KakaoPayApproveRequestVO.builder()
																.tid(responseVO.getTid())
																.partner_order_id(requestVO.getPartner_order_id())
																.partner_user_id(requestVO.getPartner_user_id())
															.build());
		//추가적으로 결제성공 페이지에서 완료정보를 등록하기 위해 알아야 할 상품구매개수 정보를 같이 전달
		PurchaseVO purchaseVO= PurchaseVO.builder().no(packageReserveDto.getPackageBookingNo()).build();
		session.setAttribute("purchase", purchaseVO);//상품이 1개라면
		//session.setAttribute("purchase", Arrays.asList(purchaseVO));//1.8부터
		//session.setAttribute("purchase", List.of(purchaseVO));//상품이 여러개라면(9부터)
		//결제 번호도 세션으로 전달
		session.setAttribute("paymentNo", paymentNo);
		
		//예약을 위한 정보 전달
		session.setAttribute("packageReserveDto", packageReserveDto);
		
		return "redirect:"+responseVO.getNext_redirect_pc_url();
	}
	
	//골프장 결제
	@PostMapping("booking/payment")
	public String golfBookingPayment(
				@ModelAttribute BookingPurchaseVO bookingPurchaseVO,
				Model model, HttpSession session
			) throws URISyntaxException {
		
		BookingDto bookingDto = bookingDao.checkBooking(bookingPurchaseVO.getTeeTimeNo(), bookingPurchaseVO.getTeeTimeD());
		//이미 예약된 상품이라면
				if(bookingDto != null) {
					return "redirect:/booking/paymentinfo";
				}
				
		//결제 준비(ready) 요청을 진행
		int paymentNo = paymentDao.sequence();
		KakaoPayReadyRequestVO requestVO = 
									KakaoPayReadyRequestVO.builder()
												.partner_order_id(String.valueOf(paymentNo))
												.partner_user_id(session.getId())
												.item_name("골북이("+bookingPurchaseVO.getFieldName()+")예약")
												.quantity(bookingPurchaseVO.getQuantity())
												.total_amount(bookingPurchaseVO.getBookingPrice())
											.build();
		KakaoPayReadyResponseVO responseVO = kakaoPayService.ready(requestVO);
		
		//결제성공 페이지에서 승인요청을 보내기 위해 알아야할 데이터 3개를 세션에 임시로 추가한다
		//-> 결제가 성공할지 실패할지 취소될지 모르기 때문에 모든 경우에 추가한 데이터를 지워야 한다
		session.setAttribute("pay", KakaoPayApproveRequestVO.builder()
																.tid(responseVO.getTid())
																.partner_order_id(requestVO.getPartner_order_id())
																.partner_user_id(requestVO.getPartner_user_id())
															.build());
		//추가적으로 결제성공 페이지에서 완료정보를 등록하기 위해 알아야 할 상품구매개수 정보를 같이 전달
		PurchaseVO purchaseVO= PurchaseVO.builder().no(bookingPurchaseVO.getTeeTimeNo()).build();
		session.setAttribute("purchase", purchaseVO);//상품이 1개라면
		//session.setAttribute("purchase", Arrays.asList(purchaseVO));//1.8부터
		//session.setAttribute("purchase", List.of(purchaseVO));//상품이 여러개라면(9부터)
		//결제 번호도 세션으로 전달
		session.setAttribute("paymentNo", paymentNo);
		
		//예약을 위한 정보 전달
		session.setAttribute("bookingPurchaseVO", bookingPurchaseVO);
					
		return "redirect:"+responseVO.getNext_redirect_pc_url();
	}
	
	
	//승인/취소/실패 : 카카오 API에 신청한 URL로 처리
		@GetMapping("/pay/approve")
		public String paySuccess(@RequestParam String pg_token, HttpSession session) throws URISyntaxException {
			//세션에 추가된 정보를 받고 세션에서 삭제한다(tid, partner_order_id, partner_user_id)
			// -> 취소 , 실패 , 성공 모두다 삭제하도록 처리
			System.out.println("pg_token >>>" + pg_token);
			KakaoPayApproveRequestVO requestVO = 
										(KakaoPayApproveRequestVO) session.getAttribute("pay");
			session.removeAttribute("pay");
			System.out.println("requestVO >>>" + requestVO);

			PurchaseVO purchaseVO = (PurchaseVO) session.getAttribute("purchase");
			session.removeAttribute("purchase");
			System.out.println("purchaseVO >>>" + purchaseVO);
  
			int paymentNo = (int) session.getAttribute("paymentNo");
			System.out.println("paymentNo >>>" + paymentNo);
			session.removeAttribute("paymentNo");
			
			//주어진 정보를 토대로 승인(approve) 요청을 보낸다
			requestVO.setPg_token(pg_token);
			KakaoPayApproveResponseVO responseVO = kakaoPayService.approve(requestVO);
			
			
			paymentService.insert(paymentNo,  responseVO, purchaseVO);
			
			if((BookingPurchaseVO) session.getAttribute("bookingPurchaseVO")!=null) {
			//골프장 예약 처리
			BookingPurchaseVO bookingPurchaseVO = (BookingPurchaseVO) session.getAttribute("bookingPurchaseVO");
			session.removeAttribute("bookingPurchaseVO");
			if(bookingPurchaseVO != null) {
				//예약처리
				 String memberId = (String) session.getAttribute("login"); 
				 MemberDto memberDto = memberDao.info(memberId); 
				 bookingPurchaseVO.setMemberId(memberId);
				 bookingPurchaseVO.setBookingName(memberDto.getMemberName());
				 bookingDao.payReservation(bookingPurchaseVO);
				 
				//수수료 추가
				int commission = bookingPurchaseVO.getBookingPrice()/10;
				golfFieldDao.addCommission(bookingPurchaseVO.getFieldName(),commission);
				 
				 //골프장결제 DB저장
				 bookingDao.paymentInsert(bookingPurchaseVO.getBookingNo(),paymentNo);
			}
			}
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>gg");
			if((PackageReserveDto) session.getAttribute("packageReserveDto")!=null) {
			//패키지 예약 처리
			PackageReserveDto packageReserveDto = (PackageReserveDto) session.getAttribute("packageReserveDto");
			session.removeAttribute("packageReserveDto");
			if(packageReserveDto!=null) {
				//예약처리
				String memberId = (String) session.getAttribute("login");
				MemberDto memberDto = memberDao.info(memberId);
				packageReserveDto.setMemberId(memberId);
				
				packageReserveDao.reserve(packageReserveDto);
				 
//				 //골프장결제 DB저장
				packageReserveDao.paymentInsert(packageReserveDto.getPackageBookingNo(),paymentNo);
			}
			}
		//return "redirect:/pay/finish";
		return "redirect:finish";
	}
	
	@GetMapping("/pay/payment")
	public String payPayment() {
		return "pay/payment";
	}
	
	@GetMapping("/pay/finish")
	public String payFinish() {
		return "pay/finish";
	}
	
	@GetMapping("/pay/cancel")
	public String payCancel(HttpSession session) {
		session.removeAttribute("pay");
		session.removeAttribute("purchase");
		session.removeAttribute("paymentNo");
		return "pay/cancel";
	}
	
	@GetMapping("/pay/fail")
	public String payFail(HttpSession session) {
		session.removeAttribute("pay");
		session.removeAttribute("purchase");
		session.removeAttribute("paymentNo");
		return "pay/fail";
	}
	
	@GetMapping("/pay/list")
	public String history(Model model) {
		model.addAttribute("list", paymentDao.list());
		return "pay/list";
	}
	
	@GetMapping("/cancel")
	public String cancelDetail(@RequestParam int paymentNo) throws URISyntaxException {
		//정보 조회
		PaymentDto paymentDto = paymentDao.find(paymentNo);
		if(paymentDto == null) {
			//404 처리
			//throw new CannotFindException();
		}

		//실제 취소
		KakaoPayCancelRequestVO requestVO = 
									KakaoPayCancelRequestVO.builder()
										.tid(paymentDto.getPaymentTid())
										.cancel_amount(paymentDto.getPaymentTotal())
									.build();
		KakaoPayCancelResponseVO responseVO = kakaoPayService.cancel(requestVO);

		//DB 처리

		return "redirect:list?paymentNo="+paymentDto.getPaymentNo();
	}


	@GetMapping("/booking/cancelPayment")
	public String cancelBooking(@RequestParam int bookingNo, @RequestParam String fieldName) throws URISyntaxException {
		
		int paymentNo = paymentDao.getBookingPaymentNo(bookingNo);
		PaymentDto paymentDto = paymentDao.find(paymentNo);
		
		//실제 취소
		KakaoPayCancelRequestVO requestVO = 
									KakaoPayCancelRequestVO.builder()
										.tid(paymentDto.getPaymentTid())
										.cancel_amount(paymentDto.getPaymentTotal())
									.build();
		KakaoPayCancelResponseVO responseVO = kakaoPayService.cancel(requestVO);
		
		//DB 처리
		paymentDao.cancel(paymentNo);
		//예약 취소 처리
		bookingDao.cancel(bookingNo);
		//수수료 처리
		BookingDto bookingDto = bookingDao.info(bookingNo);
		int commission = bookingDto.getBookingPrice()/10;
		golfFieldDao.minusCommission(fieldName,commission);
		
		return "redirect:/booking/mybooking";
		}
	
	
	@GetMapping("/package/cancelPayment")
	public String cancelPackage(@RequestParam int packageBookingNo) throws URISyntaxException {
		
		int paymentNo = paymentDao.getPackagePaymentNo(packageBookingNo);
		PaymentDto paymentDto = paymentDao.find(paymentNo);
		
		//실제 취소
		KakaoPayCancelRequestVO requestVO = 
									KakaoPayCancelRequestVO.builder()
										.tid(paymentDto.getPaymentTid())
										.cancel_amount(paymentDto.getPaymentTotal())
									.build();
		KakaoPayCancelResponseVO responseVO = kakaoPayService.cancel(requestVO);
		
		//DB 처리
		paymentDao.cancel(paymentNo);
		//예약 취소 처리
		packageReserveDao.cancel(packageBookingNo);
	
		
		return "redirect:/package/reserve_list";
		}

	
}
