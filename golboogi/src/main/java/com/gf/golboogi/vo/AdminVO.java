package com.gf.golboogi.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AdminVO {
	private String golfManagerId;
	private int fieldNo;
	private String fieldName;
	
//	여기서 부터는 추가분
	private String golfManagerPw;
	private String golfManagerGrade;
}
