package com.gf.golboogi.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class GolfFieldDto {
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
	private Date fieldOpenday;
	private int fieldPeople;
	private int fieldPrepay;
	private int fieldCommission;
	private String fieldArea;
}
