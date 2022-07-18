package com.gf.golboogi.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class Teetime1VO {
	private int teeTimeNo;
	private int fieldNo;
	private String fieldName;
	private int courseNo;
	private String courseName;
	private int fieldGreenfee;
	private String teeTimeT;
	private int partTime;
}