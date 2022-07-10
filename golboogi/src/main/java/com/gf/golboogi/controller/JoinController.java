package com.gf.golboogi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gf.golboogi.repository.JoinDao;
import com.gf.golboogi.vo.JoinListVO;

@Controller
@RequestMapping("/join")
public class JoinController {

	@Autowired
	private JoinDao joinDao;
	
	@GetMapping("/list")
	public String list(Model model) {
		List<JoinListVO> list = joinDao.selectList();
		model.addAttribute("list",list);
		return "join/list"; 
	}
}
