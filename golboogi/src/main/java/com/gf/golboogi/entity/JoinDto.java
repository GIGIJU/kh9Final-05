package com.gf.golboogi.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class JoinDto {
	private int joinNo;
	private int bookingNo;
	private String memberId;
	private String joinInfo;
	private String joinTime;
	private int joinStatus;
	private int joinPeople;
}
