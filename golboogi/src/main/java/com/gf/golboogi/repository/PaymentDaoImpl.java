package com.gf.golboogi.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.PaymentDto;

@Repository
public class PaymentDaoImpl implements PaymentDao{

	@Override
	public int sequence() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertPayment(PaymentDto paymentDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<PaymentDto> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PaymentDto find(int paymentNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
