package com.gf.golboogi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gf.golboogi.repository.GolfFieldDao;

@Controller
@RequestMapping("/manager")
public class GolfManagerController {
	@Autowired  GolfFieldDao golfFieldDao;
	
	@GetMapping("/stat")
	public String stat() {
		return "/manager/stat";
	}
	
	@GetMapping("/tables")
	public String tables() {
		return "/manager/tables";
	}
	
	@GetMapping("/charts")
	public String charts() {
		return "/manager/charts";
	}
	
	@GetMapping("/payment")
	public String payment() {
		return "/manager/payment";
	}
}
