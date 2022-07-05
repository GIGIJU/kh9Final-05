package com.gf.golboogi.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ReviewDto {
	
	private int reviewNo;
	private String reviewWriter;
	private String fieldName;
	private String reviewTitle;
	private Date reviewTime;
	private int reviewReadcount;
	private int reviewSuggestion;
	private double reviewRating;
	private double reviewCaddie;
	private double reviewCos;
	private double reviewPrice;
	private double reviewFacility;
	private String reviewContent;
}
