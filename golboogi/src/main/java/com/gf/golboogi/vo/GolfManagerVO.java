package com.gf.golboogi.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class GolfManagerVO {
	
	private String golfManagerId;
	private int fieldNo;
	private String fieldName;
	private int courseNo;
	private String courseName;
	private int teeTimeNo;
	private Date teeTimeD;
	private String memberId;
	private String bookingName;
	private Date bookingDate;
	private int bookingPeople;
	private int bookingPrice;
	private String bookingStatus;
	private Date bookingDropAble;
	
}
