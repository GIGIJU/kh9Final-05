package com.gf.golboogi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gf.golboogi.repository.GolfManagerDao;
import com.gf.golboogi.vo.GolfManagerVO;

@Controller
@RequestMapping("/manager")
public class GolfManagerController {
	
	@Autowired GolfManagerDao golfManagerDao;
	
	@GetMapping("/stat/{adminId}")
	public String stat(
			Model model,
			@PathVariable String adminId) {
		
		String golfManagerId = adminId;
//		System.out.println("id = " + golfManagerId);
		List<GolfManagerVO> vo = golfManagerDao.list(golfManagerId);
		model.addAttribute("golfManagerVO", vo);
//		System.out.println("model = " + model);
		return "/manager/stat";
	}
	
	@GetMapping("/tables/{adminId}")
	public String tables(
			Model model,
			@PathVariable String adminId
			) {
		String golfManagerId = adminId;
		List<GolfManagerVO> vo = golfManagerDao.list(golfManagerId);
		model.addAttribute("golfManagerVO", vo);
		
		return "/manager/tables";
	}
	
	@GetMapping("/charts/{adminId}")
	public String charts() {
		return "/manager/charts";
	}
	
	@GetMapping("/payment/{adminId}")
	public String payment() {
		return "/manager/payment";
	}
}
