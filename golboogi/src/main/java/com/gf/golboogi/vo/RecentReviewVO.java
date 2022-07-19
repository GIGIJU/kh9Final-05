package com.gf.golboogi.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class RecentReviewVO {
	private int reviewNo, attachmentNo;
	private String fieldName, memberNick;
	private Date reviewTime;
	
}
