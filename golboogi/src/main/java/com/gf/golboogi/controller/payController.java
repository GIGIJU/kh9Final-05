package com.gf.golboogi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gf.golboogi.repository.PaymentDao;
import com.gf.golboogi.service.KakaoPayService;
import com.gf.golboogi.service.PaymentService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class payController {
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	private PaymentService paymentService;
	
	
	
	
}
