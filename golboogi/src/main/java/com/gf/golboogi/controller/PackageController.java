package com.gf.golboogi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.error.CannotFindException;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.repository.StayDao;


@Controller
@RequestMapping("/package") 
public class PackageController {
	
	@Autowired
	private StayDao stayDao;
	
	@Autowired
	private GolfFieldDao golfFieldDao;

	//패키지 목록
	@GetMapping("/list")
	public String list(Model model) {
	    List<StayDto> list = stayDao.list();
	    List<GolfFieldDto> list2 = golfFieldDao.selectList();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		return "package/list";
	}
	
	@GetMapping("/detail")
	public String insert(@RequestParam int stayNo, Model model) {
		StayDto stayDto = stayDao.one(stayNo);
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
	