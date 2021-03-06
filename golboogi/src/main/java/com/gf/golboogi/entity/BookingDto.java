package com.gf.golboogi.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BookingDto {
	private int bookingNo;
	private String memberId;
	private int teeTimeNo;
	private String teeTimeD;
	private String bookingName;
	private Date bookingDate;
	private int bookingPeople;
	private int bookingPrice;
	private String bookingStatus;
	private Date bookingDropAble;
}
