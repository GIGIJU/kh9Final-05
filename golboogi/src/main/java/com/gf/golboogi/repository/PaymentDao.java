package com.gf.golboogi.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.PaymentDetailDto;
import com.gf.golboogi.entity.PaymentDto;

public interface PaymentDao {
	int sequence();
	int insertPayment(PaymentDto paymentDto);
	List<PaymentDto> list();
	PaymentDto find(int paymentNo);
	
	int insertPaymentDetail(PaymentDetailDto paymentDetailDto);
	
}
