package com.gf.golboogi.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class NoticeDto {
	private int noticeNo;
	private String noticeHead;
	private String noticeTitle;
	private String noticeTime;
	private int noticeReadcount;
}
