package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.gf.golboogi.entity.PaymentDetailDto;
import com.gf.golboogi.entity.PaymentDto;

@Repository
public class PaymentDaoImpl implements PaymentDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int sequence() {
		return sqlSession.selectOne("payment.sequence");
	}

	@Override
	public int insertPayment(PaymentDto paymentDto) {
		int sequence = sqlSession.selectOne("payment.sequence");
		paymentDto.setPaymentNo(sequence);
		sqlSession.insert("payment.insert", paymentDto);
		return sequence;
	}

	
	@Override
	public int insertPaymentDetail(PaymentDetailDto paymentDetailDto) {
		int sequence = sqlSession.selectOne("paymentDetail.sequence");
		paymentDetailDto.setPaymentDetailNo(sequence);
		sqlSession.insert("paymentDetail.insert", paymentDetailDto);
		return sequence;
	}

	@Override
	public List<PaymentDto> list() {
		return sqlSession.selectList("payment.list");
	}

	@Override
	public PaymentDto find(int paymentNo) {
		return sqlSession.selectOne("payment.one", paymentNo);
	}



}
