package com.gf.golboogi.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class JoinApplyListVO {
	private int joinApplyNo;
	private int joinNo;
	private String memberId;
	private int joinApplyPeople;
	private String joinApplyInfo;
	private int joinApplyStatus;
	private int memberProfile;
	private String memberNick;
	private String memberPhone;
	private String memberGender;
}
