package com.gf.golboogi.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class JoinApplyDto {
	private int joinApplyNo;
	private int joinNo;
	private String memberId;
	private int joinApplyPeople;
	private String joinApplyInfo;
	private int joinApplyStatus;
}
