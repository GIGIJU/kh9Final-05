package com.gf.golboogi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ViewController {

	@GetMapping("/home")
	public String home() {
		return "home";
	}
	
	@GetMapping("/default")
	public String def() {
		return "default";
	}
	
	@GetMapping("/timing")
	public String timing() {
		return "timing";
	}
	
	@GetMapping("/multiuser")
	public String multiuser() {
		return "multiuser";
	}
	@GetMapping("/chatbot")
	public String chatbot() {
		return "chatbot";
	}
}
				
