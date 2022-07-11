package com.gf.golboogi.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PaymentDetailDto {
	private int paymentDetailNo;
	private int paymentNo;
	private String paymentDetailName;
	private int paymentDetailQuantity;
	private int paymentDetailPrice;
	private String paymentDetailStatus;
	
	public int getPaymentTotal() {
		return this.paymentDetailPrice * this.paymentDetailQuantity;
	}
}
