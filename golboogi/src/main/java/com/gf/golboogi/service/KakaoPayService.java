package com.gf.golboogi.service;

import java.net.URISyntaxException;

import com.gf.golboogi.vo.KakaoPayApproveRequestVO;
import com.gf.golboogi.vo.KakaoPayApproveResponseVO;
import com.gf.golboogi.vo.KakaoPayCancelRequestVO;
import com.gf.golboogi.vo.KakaoPayCancelResponseVO;
import com.gf.golboogi.vo.KakaoPayOrderRequestVO;
import com.gf.golboogi.vo.KakaoPayOrderResponseVO;
import com.gf.golboogi.vo.KakaoPayReadyRequestVO;
import com.gf.golboogi.vo.KakaoPayReadyResponseVO;

public interface KakaoPayService {
	//결제준비
	KakaoPayReadyResponseVO ready(KakaoPayReadyRequestVO requestVO) throws URISyntaxException;
	//결제승인
	KakaoPayApproveResponseVO approve(KakaoPayApproveRequestVO requestVO) throws URISyntaxException;
	KakaoPayOrderResponseVO order(KakaoPayOrderRequestVO requestVO) throws URISyntaxException;
	KakaoPayCancelResponseVO cancel(KakaoPayCancelRequestVO requestVO) throws URISyntaxException;  
	
}
