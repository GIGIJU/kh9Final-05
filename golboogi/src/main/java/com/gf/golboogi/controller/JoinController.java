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

import com.gf.golboogi.entity.JoinDto;
import com.gf.golboogi.repository.JoinDao;
import com.gf.golboogi.vo.JoinListVO;
import com.gf.golboogi.vo.MyJoinApplyListVO;
import com.gf.golboogi.vo.MyJoinListVO;

@Controller
@RequestMapping("/join")
public class JoinController {

	@Autowired
	private JoinDao joinDao;
	
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1") int p,
			@RequestParam(required = false, defaultValue = "10") int s,
			HttpSession session) {
		List<JoinListVO> list = joinDao.selectList(type,keyword,p,s);
		model.addAttribute("list",list);
		
		boolean search = type != null && keyword != null;
		model.addAttribute("search", search);
		
		int count = joinDao.count(type, keyword);
		int lastPage = (count + s - 1) / s;
		
		int blockSize = 10;//블록 크기
		int endBlock = (p + blockSize - 1) / blockSize * blockSize;
		int startBlock = endBlock - (blockSize - 1);
		if(endBlock > lastPage){
			endBlock = lastPage;
		}
		
		String memberId = (String) session.getAttribute("login");
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("p", p);
		model.addAttribute("s", s);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("lastPage", lastPage);
		
		return "join/list"; 
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute JoinDto joinDto,HttpSession session) {
		String memberId = (String) session.getAttribute("login");
		joinDto.setMemberId(memberId);
		
		joinDao.insert(joinDto);
		return "redirect:/join/list";
	}
	
	@GetMapping("/myjoin")
	public String myJoin(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("login");
		List<MyJoinListVO> joinList = joinDao.myJoinList(memberId);
		List<MyJoinApplyListVO> joinApplyList = joinDao.myJoinApplyList(memberId);
		System.out.println(joinApplyList);
		
		model.addAttribute("joinList", joinList);
		model.addAttribute("joinApplyList", joinApplyList);
		return "join/myjoin";
	}

	
	//조인 신청 승인
	@GetMapping("/apply_approve/joinApplyNo/{joinApplyNo}/joinApplyPeople/{joinApplyPeople}")
	public String joinApplyApprove(@PathVariable int joinApplyNo,@PathVariable int joinApplyPeople) {
		int joinNo = joinDao.getjoinNo(joinApplyNo);
		
		joinDao.addjoinPeople(joinApplyPeople,joinNo);
		joinDao.joinApplyApprove(joinApplyNo);
		
		return "redirect:/join/myjoin";
	}
	
	//조인 신청 거절
	@GetMapping("/apply_refuse/{joinApplyNo}")
	public String joinApplyRefuse(@PathVariable int joinApplyNo) {
		joinDao.joinApplyRefuse(joinApplyNo);
		return "redirect:/join/myjoin";
	}
	
	//조인 삭제
	@GetMapping("/delete/{joinNo}")
	public String joinDelete(@PathVariable int joinNo) {
		joinDao.joinDelete(joinNo);
		return "redirect:/join/myjoin";
	}
	
	//신청 취소
	@GetMapping("/applyCancel/{joinApplyNo}")
	public String joinApplyCancel(@PathVariable int joinApplyNo) {
		joinDao.joinApplyCancel(joinApplyNo);
		return "redirect:/join/myjoin";
	}
	
}
