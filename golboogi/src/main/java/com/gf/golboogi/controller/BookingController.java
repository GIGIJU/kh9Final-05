package com.gf.golboogi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.repository.GolfFieldDao;

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
	
	@GetMapping("detail")
	public String detail(@RequestParam int fieldNo, Model model) {
		GolfFieldDto golfFieldDto = golfFieldDao.selectOne(fieldNo);
		
		model.addAttribute("golfFieldDto",golfFieldDto);
		return "booking/detail";
	}
}
