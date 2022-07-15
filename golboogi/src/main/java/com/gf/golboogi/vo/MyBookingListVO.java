package com.gf.golboogi.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MyBookingListVO {
	private String memberId;
	private String bookingNo;
	private int fieldNo;
	private String fieldName;
	private String teeTimeD;
	private String teeTimeT;
	private String courseName;
	private String courseHole;
	private int bookingPrice;
	private String bookingStatus;
	private Date bookingDropAble;
	private int fieldPrepay;
	private int fieldCartfee;
	private int fieldCaddiefee;
	private Date bookingDate;
}
