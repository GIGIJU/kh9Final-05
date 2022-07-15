package com.gf.golboogi.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BookingSearchListVO {
	private int fieldNo;
	private String fieldName;
	private String fieldArea;
	private int fieldGreenfee;
	private int fieldPrepay;
	private int attachmentNo;
	private int count;
}
