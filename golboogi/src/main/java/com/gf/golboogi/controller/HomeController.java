package com.gf.golboogi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gf.golboogi.repository.ReviewDao;
import com.gf.golboogi.vo.RecentReviewVO;

@Controller
public class HomeController {
	@Autowired
	private ReviewDao reviewDao;
	
	@RequestMapping("/")
	public String index(Model model) {
		int count=3;
		List<RecentReviewVO> list = reviewDao.recentReview(count);
		model.addAttribute("recentList", list);
		return "index";
	}
	
}
