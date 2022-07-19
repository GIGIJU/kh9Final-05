package com.gf.golboogi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gf.golboogi.entity.BookingDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.entity.PaymentDto;
import com.gf.golboogi.entity.TeetimeDto;
import com.gf.golboogi.entity.bookingPaymentDto;
import com.gf.golboogi.repository.BookingDao;
import com.gf.golboogi.repository.FieldProfileDao;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.repository.MemberDao;
import com.gf.golboogi.repository.PaymentDao;
import com.gf.golboogi.repository.ReviewDao;
import com.gf.golboogi.vo.BookingComplexSearchVO;
import com.gf.golboogi.vo.BookingSearchListVO;
import com.gf.golboogi.vo.FieldProfileVO;
import com.gf.golboogi.vo.TeeTimeListVO;
import com.gf.golboogi.vo.Teetime1VO;
import com.gf.golboogi.vo.MyBookingListVO;
import com.gf.golboogi.vo.MyJoinListVO;
import com.gf.golboogi.vo.ReviewProfileVO;

@Controller
@RequestMapping("/booking")
public class BookingController {
	
	@Autowired
	private GolfFieldDao golfFieldDao;
	@Autowired
	private BookingDao bookingDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private FieldProfileDao fieldProfileDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private PaymentDao paymentDao;
	
	
	
	@GetMapping("/list")
	public String list(Model model) {
		List<BookingSearchListVO> rank = golfFieldDao.selectRank();
		List<GolfFieldDto> prepay = golfFieldDao.selectPrepay();
		List<GolfFieldDto> cheap = golfFieldDao.selectCheap();
		
		model.addAttribute("rank",rank);
		model.addAttribute("prepay",prepay);
		model.addAttribute("cheap",cheap);
		return "booking/list";
	}
	
	@GetMapping("/list_all")
	public String listAll(
			@RequestParam(required = false) String fieldArea,
			@RequestParam(required = false) String type,
			@RequestParam(required = false, defaultValue = "1") int p,
			@RequestParam(required = false, defaultValue = "9") int s,
			Model model) {
		
			List<BookingSearchListVO> list = golfFieldDao.listAll(fieldArea,type, p, s);
			model.addAttribute("list", list);
			
			boolean range = type != null;
			model.addAttribute("range", range);
			
			boolean area = fieldArea != null;
			model.addAttribute("area", area);
			 
			int count = golfFieldDao.count(fieldArea);
			int lastPage = (count + s - 1) / s;
			System.out.println(count);
			int blockSize = 10;//블록 크기
			int endBlock = (p + blockSize - 1) / blockSize * blockSize;
			int startBlock = endBlock - (blockSize - 1);
			if(endBlock > lastPage){
				endBlock = lastPage;
			}
			
			model.addAttribute("p", p);
			model.addAttribute("s", s);
			model.addAttribute("type", type);
			model.addAttribute("fieldArea", fieldArea);
			model.addAttribute("startBlock", startBlock);
			model.addAttribute("endBlock", endBlock);
			model.addAttribute("lastPage", lastPage);
			
			System.out.println(type+ fieldArea+ startBlock+ endBlock+ lastPage);
			return "booking/list_all";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int fieldNo,@RequestParam String teeTimeD, Model model) {
		GolfFieldDto golfFieldDto = golfFieldDao.selectOne(fieldNo);
		List<TeeTimeListVO> teetimeList = golfFieldDao.selectTeetimeList(fieldNo,teeTimeD);
		List<ReviewProfileVO> reviewList = reviewDao.selectOneFiled(golfFieldDto.getFieldName());
		model.addAttribute("golfFieldDto",golfFieldDto); //골프장 정보
		model.addAttribute("teetimeList",teetimeList); //예약 정보
		model.addAttribute("reviewList",reviewList); //예약 정보
		

		//골프장 이미지 다운로드 주소 추가 
		List<FieldProfileVO> list = fieldProfileDao.multiInfo(fieldNo);
		model.addAttribute("list", list);
		System.err.println("사진정보!"+list);
		if(list == null) {
			model.addAttribute("profileUrl", "/images/golf-dummy.jpg");
		}
		else {
			model.addAttribute("profileUrl", "/attachment/download?attachmentNo=");
		}
		
		return "booking/detail";
	}
	
	
	@GetMapping("/reservation")
	public String reservation(
			@RequestParam int teeTimeNo,@RequestParam String teeTimeD, Model model) {
		BookingDto bookingDto = bookingDao.checkBooking(teeTimeNo,teeTimeD);
		if(bookingDto != null){
			return "404";
		}
		
		Teetime1VO teetimeVO = golfFieldDao.selectCourse(teeTimeNo);
		GolfFieldDto golfFieldDto = golfFieldDao.oneProfile(teetimeVO.getFieldNo());
		
		model.addAttribute("teeTimeD",teeTimeD);
		model.addAttribute("golfFieldDto",golfFieldDto);
		model.addAttribute("teetimeVO",teetimeVO);
		return "booking/reservation";
	}
	
	@GetMapping("/teetime/{courseNo}")
	public String teetime(@PathVariable int courseNo){
		golfFieldDao.teetimeInsert(courseNo);
		return "redirect:/";
	}
	
	@GetMapping("/search")
	public String search(@ModelAttribute BookingComplexSearchVO searchVO,Model model) {
		System.out.println(golfFieldDao.searchList(searchVO));
		model.addAttribute("list",golfFieldDao.searchList(searchVO));
		return "booking/search_list";
	}
	
	@GetMapping("/paymentInfo")
	public String paymentInfo(@RequestParam int teeTimeNo,@RequestParam String teeTimeD, Model model) {
		BookingDto bookingDto = bookingDao.checkBooking(teeTimeNo,teeTimeD);
		if(bookingDto != null){
			return "404";
		}
		
		Teetime1VO teetimeVO = golfFieldDao.selectCourse(teeTimeNo);
		GolfFieldDto golfFieldDto = golfFieldDao.oneProfile(teetimeVO.getFieldNo());
		
		model.addAttribute("golfFieldDto",golfFieldDto);
		model.addAttribute("teetimeVO",teetimeVO);
		return "booking/paymentInfo";
	}
	
	@PostMapping("/reservation")
	public String reservation(@ModelAttribute BookingDto bookingDto,int fieldNo, HttpSession session) {
		String memberId = (String) session.getAttribute("login");
		MemberDto memberDto = memberDao.info(memberId);
		String memberName = memberDto.getMemberName();
		bookingDto.setMemberId(memberId);
		bookingDto.setBookingName(memberName);
		
		//예약
		bookingDao.reservation(bookingDto);
		
		//수수료 추가
		int commission = bookingDto.getBookingPrice()/10;
		golfFieldDao.addCommission(fieldNo,commission);
		
		return "redirect:reservation_success";
	}
	
	@GetMapping("/reservation_success")
	public String reservationSuccess() {
		return "booking/reservation_success";
	}
	
	@GetMapping("/cancel")
	public String cancelBooking(@RequestParam int bookingNo,@RequestParam String fieldName){
		bookingDao.cancel(bookingNo);
		
		BookingDto bookingDto = bookingDao.info(bookingNo);
		int commission = bookingDto.getBookingPrice()/10;
		golfFieldDao.minusCommission(fieldName,commission);
		
		return "redirect:/booking/mybooking";
	}
	
	@GetMapping("/mybooking")
	public String myBooking(Model model,HttpSession session) {
		String memberId = (String) session.getAttribute("login");
		List<MyBookingListVO> list = bookingDao.myBookingList(memberId);
		model.addAttribute("list",list);
		
		return "booking/mybooking";
	}
	
	@GetMapping("/mybooking_detail/{bookingNo}")
	public String myBookingDetail(@PathVariable int bookingNo, Model model) {
		MyBookingListVO myBookingListVO = bookingDao.myBookingInfo(bookingNo);
		MemberDto memberDto = memberDao.info(myBookingListVO.getMemberId());
		BookingDto bookingDto = bookingDao.info(bookingNo);
		//int paymentNo = paymentDao.getBookingPaymentNo(bookingNo);
		//PaymentDto paymentDto = paymentDao.find(paymentNo);
		
		model.addAttribute("myBookingListVO", myBookingListVO);
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("bookingDto", bookingDto);
		//model.addAttribute("paymentDto", paymentDto);
		
		//골프장 이미지 다운로드 주소 추가 
		List<FieldProfileVO> list = fieldProfileDao.multiInfo(myBookingListVO.getFieldNo());
		model.addAttribute("list", list);
		if(list == null) {
			model.addAttribute("profileUrl", "/images/golf-dummy.jpg");
		}
		else {
			model.addAttribute("profileUrl", "/attachment/download?attachmentNo=");
		}
		return "booking/mybooking_detail";
	}
	
}
