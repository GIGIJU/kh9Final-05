package com.gf.golboogi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.error.CannotFindException;
import com.gf.golboogi.repository.StayDao;


@Controller
@RequestMapping("/package") 
public class PackageController {
	
	@Autowired
	private StayDao stayDao;


	@GetMapping("/list ")
	public String list() {
		return "package/list";
	}
	
	@GetMapping("/detail")
	public String insert(@RequestParam int boardNo, Model model, HttpSession session) {
		StayDto stayDto = stayDao.one(boardNo);
		model.addAttribute("stayDto", stayDto);
		return "package/detail";
	}
	
	@GetMapping("/edit")
	public String edit() {
		return "package/edit";
	}
	
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

}
	