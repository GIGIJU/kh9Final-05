package com.gf.golboogi.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TeetimeDto {
	private int teetimeNo;
	private int courseNo;
	private String teetimeT;
	private int bookingFinish;
}
