package com.gf.golboogi.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class NoticeProfileListVO {
	private int noticeNo;
	private String noticeTitle;
	private Date noticeTime;
	private int noticeReadcount;
	private String noticeHead;
	private int attachmentNo;
}
