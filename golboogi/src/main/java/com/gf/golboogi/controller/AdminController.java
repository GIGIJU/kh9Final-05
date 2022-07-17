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

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.GolfManagerDto;
import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.error.CannotFindException;
import com.gf.golboogi.repository.AdminDao;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.vo.AdminVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private GolfFieldDao golfFieldDao;
	
	@GetMapping("/list")
	public String list(Model model,HttpSession session) {
		String adminId = (String)session.getAttribute("adminLogin");
		boolean adminCheck = adminDao.MyCheck(adminId);
		if(adminCheck) {
			List<AdminVO> vo = adminDao.list();
			model.addAttribute("adminVO", vo);
			//
			List<GolfFieldDto> golfFieldDto = golfFieldDao.searchSimple();
			log.debug("DTO = {}", golfFieldDto);
			model.addAttribute("golfFieldDto", golfFieldDto);
			//
			return "admin/list";
		}else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam String golfManagerId, Model model,HttpSession session) {
		String adminId = (String)session.getAttribute("adminLogin");
		boolean adminCheck = adminDao.MyCheck(adminId);
		if(adminCheck) {
			AdminVO adminVO = adminDao.detail(golfManagerId);
			model.addAttribute("adminVO",adminVO);
			return "admin/detail";
		}else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam String golfManagerId,HttpSession session) {
		String adminId = (String)session.getAttribute("adminLogin");
		boolean adminCheck = adminDao.MyCheck(adminId);
		if(adminCheck) {
			adminDao.delete(golfManagerId);
			return "redirect:list";
		}else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/insert")
	public String insert(HttpSession session) {
		String adminId = (String)session.getAttribute("adminLogin");
		boolean adminCheck = adminDao.MyCheck(adminId);
		if(adminCheck) {
			return "admin/insert";
		}else {
			throw new CannotFindException();
		}
	}
	
//	@PostMapping("/insert")
//	public String insert(@ModelAttribute GolfManagerDto golfManagerDto) {
//		adminDao.insert(golfManagerDto);
//		return "redirect:list";
//	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute AdminVO adminVO,
			Model model
			) {
		List<GolfFieldDto> golfFieldDto = golfFieldDao.searchSimple();
		log.debug("DTO = {}", golfFieldDto);
		model.addAttribute("golfFieldDto", golfFieldDto);
		adminDao.insertManager(adminVO);
		return "redirect:list";
	}
	
	@GetMapping("/member_list")
	public String memberList(Model model,HttpSession session) {
		String adminId = (String)session.getAttribute("adminLogin");
		boolean adminCheck = adminDao.MyCheck(adminId);
		if(adminCheck) {
			List<MemberDto> memberList = adminDao.memberList();
			model.addAttribute("memberList" , memberList);
			return "admin/member_list";
		}else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/member_detail")
	public String memberDetail(@RequestParam String memberId, Model model,HttpSession session) {
		String adminId = (String)session.getAttribute("adminLogin");
		boolean adminCheck = adminDao.MyCheck(adminId);
		if(adminCheck) {
			MemberDto memberDto = adminDao.memberDetail(memberId);
			model.addAttribute("memberDto", memberDto);
			return "admin/member_detail";
		}else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/member_blacklist")
	public String memberBlacklist(@RequestParam String memberId, Model model,HttpSession session) {
		String adminId = (String)session.getAttribute("adminLogin");
		boolean adminCheck = adminDao.MyCheck(adminId);
		if(adminCheck) {
			MemberDto memberDto = adminDao.memberDetail(memberId);
			model.addAttribute("memberDto", memberDto);
			return "admin/member_blacklist";
		}else {
			throw new CannotFindException();
		}
	}
	
	@PostMapping("/member_blacklist")
	public String memberBlacklist(@ModelAttribute MemberDto memberDto) {
		String memberId = memberDto.getMemberId();
		boolean success = adminDao.blacklist(memberDto);
		if(success) {
			return "redirect:member_blacklist?memberId="+memberId;
		} else {
			return "redirect:member_blacklist?error";
		}
	}
	
	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}
	
	@PostMapping("/login")
	public String login(
			@RequestParam String golfManagerId,
			@RequestParam String golfManagerPw,
			HttpSession session) {
		
		GolfManagerDto golfManagerDto = adminDao.login(golfManagerId, golfManagerPw);
		if(golfManagerDto == null) {
			return "redirect:login?error";
		} else {
			session.setAttribute("adminLogin", golfManagerDto.getGolfManagerId());
			session.setAttribute("auth", golfManagerDto.getGolfManagerGrade());
			return "redirect:/";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
			session.removeAttribute("adminLogin");
			session.removeAttribute("auth");
			return "redirect:/";
	}
	
	
	
	
	
	
	
	
}
