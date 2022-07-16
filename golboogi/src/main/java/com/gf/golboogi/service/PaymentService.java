package com.gf.golboogi.service;

import com.gf.golboogi.vo.KakaoPayApproveResponseVO;
import com.gf.golboogi.vo.PurchaseVO;

public interface PaymentService {

	
	void insert(int paymentNo, KakaoPayApproveResponseVO responseVO, PurchaseVO purchaseVO);
	
	
	
}
