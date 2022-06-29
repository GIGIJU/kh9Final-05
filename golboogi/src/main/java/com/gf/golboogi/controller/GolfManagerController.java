package com.gf.golboogi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gf.golboogi.entity.GolfManagerDto;
import com.gf.golboogi.repository.GolfManagerDao;

// 관리자 컨트롤러
@Controller
@RequestMapping("/golfManager")
public class GolfManagerController {
	
	@Autowired
	private GolfManagerDao golfManagerDao;
	
	@GetMapping("/list")
	public String list(Model model) {
		List<GolfManagerDto> list = golfManagerDao.list();
		model.addAttribute("list", list);
		return "golfManager/list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam String golfManagerId, Model model ) {
		GolfManagerDto golfManagerDto = golfManagerDao.detail(golfManagerId);
		model.addAttribute(golfManagerDto);
		return "golfManager/detail";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam String golfManagerId) {
		boolean success = golfManagerDao.delete(golfManagerId);
		if(success) {
			return "redirect:list";
		} else {
			return ""; //에러페이지나 인터셉터 구현 후 변경예정
		}
	}
	
	@GetMapping("/insert")
	public String insert() {
		return "golfManager/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute GolfManagerDto golfManagerDto) {
		golfManagerDao.insert(golfManagerDto);
		return "redirect:list";
	}
	
}
