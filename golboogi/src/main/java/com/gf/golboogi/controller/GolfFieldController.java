package com.gf.golboogi.controller;

import java.io.IOException;
import java.util.List;

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

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.repository.ReviewDao;
import com.gf.golboogi.service.GolfFieldService;


@Controller
@RequestMapping("/field")
public class GolfFieldController {
	
	@Autowired
	private GolfFieldDao golfFieldDao;
	
	@Autowired
	private GolfFieldService golfFieldService;
	
	@Autowired
	private ReviewDao reviewDao;
	
	@GetMapping("/golf_field")
	public String golfField(
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1") int p,
			@RequestParam(required = false, defaultValue = "10") int s,
			Model model) {
		
			List<GolfFieldDto> list = golfFieldDao.list(type, keyword, p, s);
			model.addAttribute("list", list);
			
			boolean search = type != null && keyword != null;
			model.addAttribute("search", search);
			 
			int count = golfFieldDao.count(type, keyword);
			int lastPage = (count + s - 1) / s;
			
			int blockSize = 10;//블록 크기
			int endBlock = (p + blockSize - 1) / blockSize * blockSize;
			int startBlock = endBlock - (blockSize - 1);
			if(endBlock > lastPage){
				endBlock = lastPage;
			}
			
			model.addAttribute("p", p);
			model.addAttribute("s", s);
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
			model.addAttribute("startBlock", startBlock);
			model.addAttribute("endBlock", endBlock);
			model.addAttribute("lastPage", lastPage);			
			return "field/golf_field";
	}
	
	@GetMapping("/detail/{fieldNo}")
	public String detail(@PathVariable int fieldNo, Model model) {
		GolfFieldDto info=golfFieldDao.selectOne(fieldNo);
		
		//review 평점 가져오기
		Double rating = reviewDao.ratingView(info.getFieldName());
		model.addAttribute("rating",rating);
		
		model.addAttribute("info", info);
		return "field/field_detail";
	}
	
	@GetMapping("/insert")
	public String insert() {
		return "field/insert";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute GolfFieldDto golfFieldDto,
			@RequestParam MultipartFile fieldProfile
			) throws IllegalStateException, IOException {
		
		golfFieldService.insert(golfFieldDto, fieldProfile);
		
		return "redirect:/field/golf_field";
	}
	
	
}
