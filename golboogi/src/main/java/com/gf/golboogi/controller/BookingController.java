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
import com.gf.golboogi.entity.TeetimeDto;
import com.gf.golboogi.repository.BookingDao;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.repository.MemberDao;
import com.gf.golboogi.vo.BookingComplexSearchVO;
import com.gf.golboogi.vo.BookingSearchListVO;
import com.gf.golboogi.vo.Teetime1VO;

@Controller
@RequestMapping("/booking")
public class BookingController {
	
	@Autowired
	private GolfFieldDao golfFieldDao;
	@Autowired
	private BookingDao bookingDao;
	@Autowired
	private MemberDao memberDao;
	
	
	@GetMapping("/list")
	public String list(Model model) {
		List<GolfFieldDto> list = golfFieldDao.selectList();
		
		model.addAttribute("list",list);
		return "booking/list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int fieldNo,@RequestParam String teeTimeD, Model model) {
		GolfFieldDto golfFieldDto = golfFieldDao.selectOne(fieldNo);
		List<TeetimeDto> teetimeList = golfFieldDao.selectTeetimeList(fieldNo,teeTimeD);
		
		model.addAttribute("golfFieldDto",golfFieldDto);
		model.addAttribute("teetimeList",teetimeList);
		
		return "booking/detail";
	}
	
	@GetMapping("/test")
	public String test(Model model) {
		model.addAttribute("list",golfFieldDao.teeTimeDayList());
		return "booking/search_list2";
	}
	
	
	@GetMapping("/reservation")
	public String reservation(
			@RequestParam int teeTimeNo,@RequestParam String teeTimeD, Model model) {
		Teetime1VO teetimeVO = golfFieldDao.selectCourse(teeTimeNo);
		GolfFieldDto golfFieldDto = golfFieldDao.selectOne(teetimeVO.getFieldNo());
		
		model.addAttribute("teeTimeD",teeTimeD);
		model.addAttribute("golfFieldDto",golfFieldDto);
		model.addAttribute("teetimeVO",teetimeVO);
		return "booking/reservation";
	}
	
	@GetMapping("/teetime")
	public String teetime(@RequestParam int courseNo){
		golfFieldDao.teetimeInsert(courseNo);
		return "redirect:/";
	}
	
	@GetMapping("/search")
	public String search(@ModelAttribute BookingComplexSearchVO searchVO,Model model) {
		model.addAttribute("list",golfFieldDao.searchList(searchVO));
		return "booking/search_list";
	}
	
	@GetMapping("/paymentInfo")
	public String paymentInfo(@RequestParam int teeTimeNo, Model model) {
		Teetime1VO teetimeVO = golfFieldDao.selectCourse(teeTimeNo);
		GolfFieldDto golfFieldDto = golfFieldDao.selectOne(teetimeVO.getFieldNo());
		
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
		
		bookingDao.reservation(bookingDto);
		
		int commission = bookingDto.getBookingPrice()/10;
		golfFieldDao.addCommission(fieldNo,commission);
		
		return "redirect:reservation_success";
	}
	
	@GetMapping("/reservation_success")
	public String reservationSuccess() {
		return "booking/reservation_success";
	}
	
	
	
}
