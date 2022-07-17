package com.gf.golboogi.controller;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.GolfManagerDto;
import com.gf.golboogi.entity.NoticeDto;
import com.gf.golboogi.error.CannotFindException;
import com.gf.golboogi.repository.AdminDao;
import com.gf.golboogi.repository.NoticeDao;
import com.gf.golboogi.repository.NoticeProfileDao;
import com.gf.golboogi.service.NoticeService;
import com.gf.golboogi.vo.NoticeProfileListVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private NoticeProfileDao noticeProfileDao;
	
	@Autowired
	private AdminDao adminDao;
	
	
	@GetMapping("/list")
	public String list(
				@RequestParam(required = false) String keyword,
				@RequestParam(required = false, defaultValue = "1") int p,
				@RequestParam(required = false, defaultValue = "10") int s,
				Model model
			) {
		
		List<NoticeProfileListVO> list = noticeDao.list(keyword, p, s);
		model.addAttribute("list", list);
		
		boolean search = keyword != null;
		model.addAttribute("search", search);
		
		int count = noticeDao.count(keyword);
		int lastPage = (count + s - 1) / s;
		
		int blockSize = 11;//블록 크기
		int endBlock = (p + blockSize - 1) / blockSize * blockSize;
		int startBlock = endBlock - (blockSize - 1);
		if(endBlock > lastPage){
			endBlock = lastPage;
		}
		
		model.addAttribute("p", p);
		model.addAttribute("s", s);
		model.addAttribute("keyword", keyword);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("lastPage", lastPage);
		
		return "notice/list";
	}
	
	@GetMapping("/write")
	public String write(HttpSession session) {
		String golfManagerId = (String)session.getAttribute("adminLogin");
		boolean success = adminDao.MyCheck(golfManagerId);
		if(success) {
			return "notice/write";
		}else {
			throw new CannotFindException();
		}
	}
	
	@PostMapping("/write")
	public String write(
			@ModelAttribute NoticeDto noticeDto,
			@RequestParam MultipartFile noticeProfile)throws IllegalStateException, IOException {
		noticeService.write(noticeDto, noticeProfile);
		return "redirect:list";
	}
	
	@GetMapping("/detail/{noticeNo}")
	public String detail(
			@PathVariable int noticeNo,
			Model model
			) {
		NoticeDto noticeDto = noticeDao.read(noticeNo);
		model.addAttribute("noticeDto", noticeDto);
		
		//관리자 판정?
		
		//프로필
		int attachmentNo = noticeProfileDao.read(noticeNo);
		if(attachmentNo == 0) {
			model.addAttribute("profileUrl", "/image/user.png");
		}
		else {
			model.addAttribute("profileUrl", "/attachment/download?attachmentNo=" + attachmentNo);
		}
		
		return "notice/detail";
	}
	
	
	@GetMapping("/edit/{noticeNo}")
	public String edit(@PathVariable int noticeNo, Model model,HttpSession session) {
		String golfManagerId = (String)session.getAttribute("adminLogin");
		boolean success = adminDao.MyCheck(golfManagerId);
		if(success) {
			NoticeDto noticeDto = noticeDao.info(noticeNo);
			model.addAttribute("noticeDto", noticeDto);
			return "notice/edit";
		}else {
			throw new CannotFindException();
		}
	}
	
	@PostMapping("/edit/{noticeNo}")
	public String edit(
			@ModelAttribute NoticeDto noticeDto,
			@PathVariable int noticeNo
			//RedirectAttributes attr
			) {
		boolean success = noticeDao.edit(noticeDto);
		if(success) {
//			attr.addAttribute("noticeNo", noticeDto.getNoticeNo());
			return "redirect:/notice/list";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/delete/{noticeNo}")
	public String delete(@PathVariable int noticeNo,HttpSession session) {
		String golfManagerId = (String)session.getAttribute("adminLogin");
		boolean success = adminDao.MyCheck(golfManagerId);
		if(success) {
			noticeDao.delete(noticeNo);
			return "redirect:/notice/list";
		}else {
			throw new CannotFindException();
		}
	}
}
