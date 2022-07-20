package com.gf.golboogi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gf.golboogi.error.CannotFindException;
import com.gf.golboogi.repository.AdminDao;
import com.gf.golboogi.repository.GolfManagerDao;
import com.gf.golboogi.vo.GolfManagerVO;

@Controller
@RequestMapping("/manager")
public class GolfManagerController {
	
	@Autowired 
	private GolfManagerDao golfManagerDao;
	
	@Autowired
	private AdminDao adminDao;
	
	@GetMapping("/stat")
	public String stat(
			HttpSession session,
			Model model
			) {
		String loginId = (String)session.getAttribute("adminLogin");
		String checkId = adminDao.golfManagerCheck(loginId);
		
		boolean idCheck = loginId != checkId;
		if(idCheck) {
			List<GolfManagerVO> vo = golfManagerDao.list(loginId);
			model.addAttribute("golfManagerVO", vo);
			return "manager/stat";
		}else {
			throw new CannotFindException();
		}
		
	}
	
	@GetMapping("/tables")
	public String tables(
			Model model,
			HttpSession session
			//@PathVariable String adminId
			) {
		//String golfManagerId = adminId;
		String loginId = (String)session.getAttribute("adminLogin");
		String checkId = adminDao.golfManagerCheck(loginId);
		boolean idCheck = loginId != checkId;
		if(idCheck) {
			//List<GolfManagerVO> vo = golfManagerDao.list(golfManagerId);
			List<GolfManagerVO> vo = golfManagerDao.list(loginId);
			model.addAttribute("golfManagerVO", vo);
			return "manager/tables";
		}else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/charts")
	public String charts(HttpSession session) {
		String loginId = (String)session.getAttribute("adminLogin");
		String checkId = adminDao.golfManagerCheck(loginId);
		boolean idCheck = loginId != checkId;
		if(idCheck) {
			return "manager/charts";
		}else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/payment")
	public String payment(HttpSession session) {
		String loginId = (String)session.getAttribute("adminLogin");
		String checkId = adminDao.golfManagerCheck(loginId);
		boolean idCheck = loginId != checkId;
		if(idCheck) {
			return "manager/payment";
		}else {
			throw new CannotFindException();
		}
	}
}
