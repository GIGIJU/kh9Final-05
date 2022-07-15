package com.gf.golboogi.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ReviewProfileVO {

	private int reviewNo;
	private String reviewWriter;
	private String reviewName;
	private String fieldName;
	private String reviewTitle;
	private Date reviewTime;
	private int reviewReadcount;
	private double reviewRating;
	private double reviewCaddie;
	private double reviewCos;
	private double reviewPrice;
	private double reviewFacility;
	private String review_content;
	private String memberName;
	private int attachmentNo;
}
