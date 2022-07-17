package com.gf.golboogi.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class GolfFieldVO {
	private int fieldNo;
	private String fieldName;
	private String fieldPost;
	private String fieldBasicAddress;
	private String fieldDetailAddress;
	private String fieldInfo;
	private String fieldPhone;
	private int fieldCaddiefee;
	private int fieldCartfee;
	private int fieldGreenfee;
	private String fieldOpenday;
	private int fieldPeople;
	private int fieldPrepay;
	private int fieldCommission;
	private String fieldArea;

	private String golfManagerId;
	private int golfManagerGrade;
}