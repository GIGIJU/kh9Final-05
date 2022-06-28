package com.gf.golboogi.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class GolfManagerDto {
	private String golfManagerId;
	private int fieldNo;
	private String golfManagerPw;
	private int golfManagerGrade;
}
