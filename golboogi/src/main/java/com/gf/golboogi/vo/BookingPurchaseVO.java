package com.gf.golboogi.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BookingPurchaseVO {
	private int teeTimeNo;
	private String teeTimeD;
	private int bookingPrice;
	private int quantity=1;
	private String fieldName;
}
