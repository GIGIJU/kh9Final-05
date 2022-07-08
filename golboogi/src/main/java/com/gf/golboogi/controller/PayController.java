package com.gf.golboogi.controller;



import java.net.URISyntaxException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gf.golboogi.repository.PaymentDao;
import com.gf.golboogi.repository.StayDao;
import com.gf.golboogi.entity.PaymentDto;
import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.entity.PaymentDetailDto;
import com.gf.golboogi.service.KakaoPayService;
import com.gf.golboogi.vo.KakaoPayApproveRequestVO;
import com.gf.golboogi.vo.KakaoPayApproveResponseVO;
import com.gf.golboogi.vo.KakaoPayReadyRequestVO;
import com.gf.golboogi.vo.KakaoPayReadyResponseVO;
import com.gf.golboogi.vo.PurchaseVO;

import lombok.extern.log4j.Log4j2;

@Controller
public class PayController {

	@Autowired
	private StayDao stayDao;
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
	private PaymentDao paymentDao;

	
	@PostMapping("package/package_purchase")
	public String pay1Purchase(
				//@RequestParam int no, @RequestParam int quantity
				@ModelAttribute PurchaseVO purchaseVO, HttpSession session
			) throws URISyntaxException {
		
		StayDto stayDto = stayDao.one(purchaseVO.getNo());
		
		//결제 준비(ready) 요청을 진행
		int totalAmount = stayDto.getStayPrice() * purchaseVO.getQuantity();
		KakaoPayReadyRequestVO requestVO = 
									KakaoPayReadyRequestVO.builder()
												.partner_order_id(UUID.randomUUID().toString())
												.partner_user_id("testuser1")
												.item_name(stayDto.getStayName())
												.quantity(purchaseVO.getQuantity())
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
		session.setAttribute("purchase", purchaseVO);//상품이 1개라면
		//session.setAttribute("purchase", Arrays.asList(purchaseVO));//1.8부터
		//session.setAttribute("purchase", List.of(purchaseVO));//상품이 여러개라면(9부터)
		
		return "redirect:"+responseVO.getNext_redirect_pc_url();
	}
	
	
	
	//승인/취소/실패 : 카카오 API에 신청한 URL로 처리
	@GetMapping("/approve")
	public String paySuccess(@RequestParam String pg_token, HttpSession session) throws URISyntaxException {
		//세션에 추가된 정보를 받고 세션에서 삭제한다(tid, partner_order_id, partner_user_id)
		// -> 취소 , 실패 , 성공 모두다 삭제하도록 처리
		KakaoPayApproveRequestVO requestVO = 
									(KakaoPayApproveRequestVO) session.getAttribute("pay");
		session.removeAttribute("pay");
		List<PurchaseVO> purchaseList = (List<PurchaseVO>) session.getAttribute("purchase");
		session.removeAttribute("purchase");
		
		//주어진 정보를 토대로 승인(approve) 요청을 보낸다
		requestVO.setPg_token(pg_token);
		KakaoPayApproveResponseVO responseVO = kakaoPayService.approve(requestVO);
		
		//결제 승인까지 완료된 현 시점에서 결제 정보들을 DB에 저장해야 한다
		//- PaymentDto : KakaoPayApproveResponseVO에 있는 정보로 등록이 가능
		//- PaymentDetailDto : 추가 정보가 없다면 등록이 불가능하다
		PaymentDto paymentDto = PaymentDto.builder()
														.paymentTid(responseVO.getTid())
														.paymentName(responseVO.getItem_name())
														.paymentTotal(responseVO.getAmount().getTotal())
													.build();
		int paymentNo = paymentDao.insertPayment(paymentDto);
		
		//purchaseList에 들어있는 상품 번호와 상품 수량을 토대로 상세 정보를 등록
		for(PurchaseVO purchaseVO : purchaseList) {
			StayDto stayDto = stayDao.one(purchaseVO.getNo());
			PaymentDetailDto paymentDetailDto = PaymentDetailDto.builder()
																	.paymentNo(paymentNo)
																	.paymentDetailName(stayDto.getStayName())
																	.paymentDetailPrice(stayDto.getStayPrice())
																	.paymentDetailQuantity(purchaseVO.getQuantity())
																.build();
			paymentDao.insertPaymentDetail(paymentDetailDto);
		}
		
//		return "redirect:/pay/finish";
		return "redirect:finish";
	}
	
	
	@GetMapping("/finish")
	public String payFinish() {
		return "pay/finish";
	}
	
	@GetMapping("/cancel")
	public String payCancel(HttpSession session) {
		session.removeAttribute("pay");
		session.removeAttribute("purchase");
		session.removeAttribute("paymentNo");
		return "pay/cancel";
	}
	
	@GetMapping("/fail")
	public String payFail(HttpSession session) {
		session.removeAttribute("pay");
		session.removeAttribute("purchase");
		session.removeAttribute("paymentNo");
		return "pay/fail";
	}
	
	
	
	

	
}
