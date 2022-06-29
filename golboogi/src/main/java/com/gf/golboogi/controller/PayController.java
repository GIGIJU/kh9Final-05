package com.gf.golboogi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gf.golboogi.repository.PaymentDao;
import com.gf.golboogi.service.KakaoPayService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class PayController {
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
	private PaymentDao paymentDao;
//	
//	@Autowired
//	private PaymentService paymentService;
	

	
}
