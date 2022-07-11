package com.gf.golboogi.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ReplyDto {
	private int replyNo;
	private String replyContent;
	private Date replyTime;
	private int replyTarget;
	private String replyWriter;
}
