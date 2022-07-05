package com.gf.golboogi.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class MessageVO {
	private String memberId;
	private String text;
	private String memberAuth;
	private Date time;
}