package com.gf.golboogi.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TeeTimeListVO {
	private int fieldNo;
	private String fieldName;
	private int fieldGreenfee;
	private String courseName;
	private String teeTimeT;
	private int partTime;
	private int teeTimeNo;
}
