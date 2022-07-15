package com.gf.golboogi.controller;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.GolfCourseDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.GolfManagerDto;
import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.repository.AdminDao;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.service.AdminInsertService;
import com.gf.golboogi.service.GolfFieldService;
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
	@Autowired
	private GolfFieldService golfFieldService;
	@Autowired
	private AdminInsertService adminInsertService;
	
	@GetMapping("/list")
	public String list(Model model) {
		List<AdminVO> vo = adminDao.list();
		model.addAttribute("adminVO", vo);
		//
		List<GolfFieldDto> golfFieldDto = golfFieldDao.searchSimple();
		log.debug("DTO = {}", golfFieldDto);
		model.addAttribute("golfFieldDto", golfFieldDto);
		//
		return "admin/list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam String golfManagerId, Model model ) {
		AdminVO adminVO = adminDao.detail(golfManagerId);
		model.addAttribute("adminVO",adminVO);
		return "admin/detail";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam String golfManagerId) {
		boolean success = adminDao.delete(golfManagerId);
		if(success) {
			return "redirect:list";
		} else {
			return "redirect:list?error";
		}
	}
	
	@GetMapping("/insert")
	public String insert(Model model) {
		List<GolfFieldDto> golfFieldDto = golfFieldDao.searchSimple();
		model.addAttribute("golfFieldDto", golfFieldDto);
		
		return "admin/insert";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute AdminVO adminVO
			) {
		adminDao.insertManager(adminVO);
		return "redirect:list";
	}
	
	@GetMapping("/member_list")
	public String memberList(Model model) {
		List<MemberDto> memberList = adminDao.memberList();
		model.addAttribute("memberList" , memberList);
		return "admin/member_list";
	}
	
	@GetMapping("/member_detail")
	public String memberDetail(@RequestParam String memberId, Model model) {
		MemberDto memberDto = adminDao.memberDetail(memberId);
		model.addAttribute("memberDto", memberDto);
		return "admin/member_detail";
	}
	
	@GetMapping("/member_blacklist")
	public String memberBlacklist(@RequestParam String memberId, Model model) {
		MemberDto memberDto = adminDao.memberDetail(memberId);
		model.addAttribute("memberDto", memberDto);
		return "admin/member_blacklist";
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
	
	@GetMapping("/field_insert")
	public String fieldInsert() {
		return "admin/field_insert";
	}
	
	@PostMapping("/field_insert")
	public String fieldInsert(
			@ModelAttribute GolfFieldDto golfFieldDto,
			@ModelAttribute GolfCourseDto golfCourseDto,
			@RequestParam List<MultipartFile> fieldProfile
			) throws IllegalStateException, IOException {
		
		adminInsertService.fieldInsert(golfFieldDto, fieldProfile);
		
		return "redirect:/field/golf_field";
	}
	
//	@PostMapping("/field_insert")
//	public String fieldInsert(
//			@ModelAttribute GolfFieldDto golfFieldDto,
//			@ModelAttribute GolfCourseDto golfCourseDto,
//			@RequestParam List<MultipartFile> fieldProfile
//			) throws IllegalStateException, IOException {
//		
//		adminInsertService.fieldInsert(golfFieldDto, fieldProfile, golfCourseDto);
//		
//		return "redirect:/field/golf_field";
//	}
	
	
	
	
	
	
	
}
