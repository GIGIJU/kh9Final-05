package com.gf.golboogi.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TeetimeDto {
	private int teeTimeNo;
	private int courseNo;
	private String teeTimeT;
	private int partTime;
}
