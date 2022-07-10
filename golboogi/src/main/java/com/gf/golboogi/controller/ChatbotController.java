package com.gf.golboogi.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gf.golboogi.entity.GolfFieldDto;

@Controller
@RequestMapping("/chatbot")
public class ChatbotController {

	@GetMapping("/chatbot")
	public String chatbot(Model model) {
		return "chatbot/chatbot";
	}
}
