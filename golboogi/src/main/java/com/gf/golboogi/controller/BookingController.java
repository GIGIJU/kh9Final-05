package com.gf.golboogi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gf.golboogi.entity.GolfCourseDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.TeetimeDto;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.vo.BookingComplexSearchVO;
import com.gf.golboogi.vo.BookingSearchListVO;
import com.gf.golboogi.vo.Teetime1VO;

@Controller
@RequestMapping("/booking")
public class BookingController {
	
	@Autowired
	private GolfFieldDao golfFieldDao;
	
	
	@GetMapping("/list")
	public String list(Model model) {
		List<GolfFieldDto> list = golfFieldDao.selectList();
		
		model.addAttribute("list",list);
		return "booking/list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int fieldNo, Model model) {
		GolfFieldDto golfFieldDto = golfFieldDao.selectOne(fieldNo);
		List<TeetimeDto> teetimeList = golfFieldDao.selectTeetimeList(fieldNo);
		
		model.addAttribute("golfFieldDto",golfFieldDto);
		model.addAttribute("teetimeList",teetimeList);
		
		return "booking/detail";
	}
	
	@GetMapping("test")
	public String test() {
		return "booking/test";
	}
	
	
	@GetMapping("/Reservation")
	public String reservation(
			@RequestParam int teeTimeNo, Model model) {
		Teetime1VO teetimeVO = golfFieldDao.selectCourse(teeTimeNo);
		GolfFieldDto golfFieldDto = golfFieldDao.selectOne(teetimeVO.getFieldNo());
		
		model.addAttribute("golfFieldDto",golfFieldDto);
		model.addAttribute("teetimeVO",teetimeVO);
		return "booking/reservation";
	}
	
	@GetMapping("/teetime")
	public String teetime(@RequestParam int courseNo){
		golfFieldDao.teetimeInsert(courseNo);
		return "/";
	}
	
	@GetMapping("/search")
	public String search(@ModelAttribute BookingComplexSearchVO searchVO,Model model) {
		List<BookingSearchListVO> list = golfFieldDao.searchList(searchVO);
		model.addAttribute("list",list);
		
		return "booking/search_list";
	}
	
	@GetMapping("/paymentInfo")
	public String paymentInfo(@RequestParam int teeTimeNo, Model model) {
		Teetime1VO teetimeVO = golfFieldDao.selectCourse(teeTimeNo);
		
		model.addAttribute("teetimeVO",teetimeVO);
		return "booking/paymentInfo";
	}
	
	
	
}
