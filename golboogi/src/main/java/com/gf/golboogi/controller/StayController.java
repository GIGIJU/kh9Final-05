package com.gf.golboogi.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.error.CannotFindException;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.repository.PackageDao;
import com.gf.golboogi.repository.StayDao;
import com.gf.golboogi.service.StayService;

@Controller
@RequestMapping("/stay") 
public class StayController {
	@Autowired
	private StayDao stayDao;
	
//	@Autowired
//	private StayService stayService;
	
	@Autowired
	private PackageDao packageDao;
	
	
	@Autowired
	private GolfFieldDao golfFieldDao;
	
	//숙소 목록
	@GetMapping("/list")
	public String list(Model model) {
	    List<StayDto> list = stayDao.list();
		model.addAttribute("list",list);
		return "stay/list";
	}
	
	//숙소 상세
	@GetMapping("/detail")
	public String detail(@RequestParam int stayNo, Model model) {
		StayDto stayDto = stayDao.one(stayNo);
		model.addAttribute("stayDto", stayDto);
		return "stay/detail";
	}
	
	//숙소삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int stayNo){
		boolean success = stayDao.delete(stayNo);
		if(success) {
			return "redirect:list";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	//숙소 등록 @이기주
	@GetMapping("/insert")
	public String insert() {
		return "stay/insert";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute StayDto stayDto
			) throws IllegalStateException, IOException {
		stayDao.insert(stayDto);
		
//		model.addAttribute("stayDto", stayDto);
		return "stay/list";
		
	}
	
}
