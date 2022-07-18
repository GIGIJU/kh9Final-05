package com.gf.golboogi.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class bookingPaymentDto {
	private int bookingNo;
	private int paymentNo;
}
