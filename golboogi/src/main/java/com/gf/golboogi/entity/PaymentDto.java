package com.gf.golboogi.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PaymentDto {
	private int  paymentNo;
	private int  bookingNo;
	private String paymentTid;
	private int paymentTotal;
	private Date paymentTime;
	private String paymentStatus;
	
}
