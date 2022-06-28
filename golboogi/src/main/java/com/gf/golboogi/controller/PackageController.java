package com.gf.golboogi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/package") 
public class PackageController {

	@RequestMapping("/list")
	public String list() {
		return "package/list";
	}
}
	