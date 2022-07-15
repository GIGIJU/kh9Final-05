package com.gf.golboogi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gf.golboogi.entity.PaymentDto;
import com.gf.golboogi.repository.PaymentDao;
import com.gf.golboogi.vo.KakaoPayApproveResponseVO;
import com.gf.golboogi.vo.PurchaseVO;
@Service
public class PaymentServiceImpl  implements PaymentService {

	
	@Autowired
	private PaymentDao paymentDao;
	
	
	@Transactional
	@Override
	public void insert(int paymentNo, KakaoPayApproveResponseVO responseVO, PurchaseVO purchaseVO) {
		
		System.out.println("paymentNo >>>" + paymentNo);
		System.out.println("responseVO >>>" + responseVO);
		System.out.println("purchaseVO >>>" + purchaseVO);
		 //결제 승인까지 완료된 현 시점에서 결제 정보들을 DB에 저장해야 한다
		//- PaymentDto : KakaoPayApproveResponseVO에 있는 정보로 등록이 가능
		//- PaymentDetailDto : 추가 정보가 없다면 등록이 불가능하다
		PaymentDto paymentDto = PaymentDto.builder()
															.paymentNo(paymentNo)
															.paymentTid(responseVO.getTid())
															.paymentName(responseVO.getItem_name())
															.paymentTotal(responseVO.getAmount().getTotal())
														.build();
		paymentDao.insertPayment(paymentDto);
		
	}

	
}
