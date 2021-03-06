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

import com.gf.golboogi.entity.AttachmentDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.ReviewDto;
import com.gf.golboogi.error.CannotFindException;
import com.gf.golboogi.repository.AttachmentDao;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.repository.ReviewDao;
import com.gf.golboogi.repository.ReviewProfileDao;
import com.gf.golboogi.service.ReviewService;
import com.gf.golboogi.vo.ReviewProfileVO;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ReviewProfileDao reviewProfileDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private GolfFieldDao golfFieldDao;
	
	@GetMapping("/list")
	public String list(
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1") int p,
			@RequestParam(required = false, defaultValue = "10") int s,
			Model model
			) {
		List<ReviewProfileVO> list = reviewDao.list(keyword, p, s);
		model.addAttribute("list", list);
		
		boolean search = keyword != null;
		model.addAttribute("search", search);
		
		int count = reviewDao.count(keyword);
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
		return "review/list";
	}
	
	@GetMapping("/write/{fieldName}")
	public String write(HttpSession session,
			@PathVariable (required = false)String fieldName,
			Model model) {
		String memberId = (String)session.getAttribute("login");
		model.addAttribute("fieldName",fieldName);
		model.addAttribute("memberId",memberId);
		return "review/write";
	}
	
	@GetMapping("/write")
	public String write(HttpSession session,
			Model model) {
		String memberId = (String)session.getAttribute("login");
		List<GolfFieldDto> list = golfFieldDao.searchSimple();
		model.addAttribute("list",list);
		model.addAttribute("memberId",memberId);
		return "review/write";
	}
	
	@PostMapping("/write/{fieldName}")
	public String write(@ModelAttribute ReviewDto reviewDto,
			@PathVariable (required = false)String fieldName,
			@RequestParam MultipartFile reviewProfile)throws IllegalStateException, IOException {
		reviewDto.setFieldName(fieldName);
		reviewService.write(reviewDto, reviewProfile);
		return "redirect:/review/list";
	}
	
	
	@PostMapping("/write")
	public String write(@ModelAttribute ReviewDto reviewDto,
			@RequestParam MultipartFile reviewProfile)throws IllegalStateException, IOException {
		reviewService.write(reviewDto, reviewProfile);
		return "redirect:list";
	}
	
	@GetMapping("/detail/{reviewNo}")
	public String detail(
			@PathVariable int reviewNo,
			HttpSession session,
			Model model
			) {
		String memberId = (String)session.getAttribute("login");
		ReviewDto reviewDto = reviewDao.read(reviewNo);
		float rating = reviewDao.ratingView(reviewDto.getFieldName());
		List<ReviewDto> list = reviewDao.otherview(reviewDto.getFieldName());
		
		model.addAttribute("rating",rating);
		model.addAttribute("reviewDto", reviewDto);
		model.addAttribute("memberId",memberId);
		model.addAttribute("list", list);
		
		int attachmentNo = reviewProfileDao.read(reviewNo);
		if(attachmentNo == 0) {
			model.addAttribute("attachmentNo",attachmentNo);
		}
		else {
			model.addAttribute("profileUrl", "/attachment/download?attachmentNo=" + attachmentNo);
		}
		
		return "review/detail";
	}
	
	@GetMapping("/edit/{reviewNo}")
	public String edit(@PathVariable int reviewNo, Model model,HttpSession session) {
			ReviewDto reviewDto = reviewDao.info(reviewNo);
			model.addAttribute("reviewDto", reviewDto);
			return "review/edit";
	}
	
	@PostMapping("/edit/{reviewNo}")
	public String edit(
			@PathVariable int reviewNo,
			@ModelAttribute ReviewDto reviewDto
			) {
		boolean success = reviewNo != 0;
		if(success) {
			reviewDto.setReviewNo(reviewNo);
			reviewDao.edit(reviewDto);
			return "redirect:/review/detail/{reviewNo}";
		}else {
			throw new CannotFindException();
		}
		
	}
	
	@GetMapping("/reviewProfile/{reviewNo}")
	public String reviewProfile(
			@PathVariable int reviewNo,
			Model model) {
		int attachmentNo = reviewProfileDao.read(reviewNo);
		AttachmentDto attachmentDto = attachmentDao.info(attachmentNo);
		if(attachmentNo == 0) {
			model.addAttribute("attachmentNo",attachmentNo);
		}
		else {
			model.addAttribute("attachmentDto", attachmentDto);
		}
		model.addAttribute("reviewNo",reviewNo);
		return "review/reviewProfile";
	}
	
	@PostMapping("/reviewProfile/{reviewNo}")
	public String reviewProfile(
			@PathVariable int reviewNo,
			@RequestParam MultipartFile reviewProfile
			)throws IllegalStateException, IOException {
		boolean success = reviewNo != 0;
		if(success) {
			reviewService.changeProfile(reviewNo, reviewProfile);
			return "redirect:/review/detail/{reviewNo}";
		}else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/delete/{reviewNo}")
	public String delete(@PathVariable int reviewNo,HttpSession session) {
			reviewDao.delete(reviewNo);
			return "redirect:/review/list";
	}
}
