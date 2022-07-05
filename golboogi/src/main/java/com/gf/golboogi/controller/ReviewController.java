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

import com.gf.golboogi.entity.ReviewDto;
import com.gf.golboogi.error.CannotFindException;
import com.gf.golboogi.repository.ReviewDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewDao reviewDao;
	
	@GetMapping("/list")
	public String list(
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1") int p,
			@RequestParam(required = false, defaultValue = "10") int s,
			Model model
			) {
		
		List<ReviewDto> list = reviewDao.list(keyword, p, s);
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
	
	@GetMapping("/write")
	public String write(HttpSession session,Model model) {
		String memberId = (String)session.getAttribute("login");
		model.addAttribute("memberId",memberId);
		return "review/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute ReviewDto reviewDto) {
		reviewDao.write(reviewDto);
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
		List<ReviewDto> list = reviewDao.otherview(reviewDto.getFieldName());
//		System.out.println(list);
		model.addAttribute("reviewDto", reviewDto);
		model.addAttribute("memberId",memberId);
		model.addAttribute("list", list);
		return "review/detail";
	}
	
	@GetMapping("/edit/{reviewNo}")
	public String edit(@PathVariable int reviewNo, Model model) {
		ReviewDto reviewDto = reviewDao.info(reviewNo);
		model.addAttribute("reviewDto", reviewDto);
		return "review/edit";
	}
	
	@PostMapping("/edit/{reviewNo}")
	public String edit(
			@ModelAttribute ReviewDto reviewDto,
			@PathVariable int reviewNo
			//RedirectAttributes attr
			) {
		boolean success = reviewDao.edit(reviewDto);
		if(success) {
			return "redirect:/review/list";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/delete/{reviewNo}")
	public String delete(@PathVariable int reviewNo) {
		boolean success = reviewDao.delete(reviewNo);
		if(success) {
			return "redirect:/review/list";
		}
		else {
			throw new CannotFindException();
		}
	}
}
