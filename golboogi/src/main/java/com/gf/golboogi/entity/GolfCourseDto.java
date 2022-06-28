package com.gf.golboogi.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class GolfCourseDto {
	private int courseNo;
	private int fieldNo;
	private String courseName;
	private String courseHole;
}
