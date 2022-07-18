package com.gf.golboogi.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class JoinListVO {
	private int joinNo;
	private String teeTimeD;
	private String teeTimeT;
	private String fieldArea;
	private int fieldNo;
	private String fieldName;
	private int joinPeople;
	private int bookingPrice;
	private String joinTime;
	private String memberNick;
	private String joinInfo;
	private int joinStatus;
	private String courseName;
	private String memberId;
}
