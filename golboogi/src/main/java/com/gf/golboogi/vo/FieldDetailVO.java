package com.gf.golboogi.vo;

import lombok.Builder;

import lombok.NoArgsConstructor;

import java.util.List;

import com.gf.golboogi.entity.GolfCourseDto;
import com.gf.golboogi.entity.GolfFieldDto;

import lombok.AllArgsConstructor;

import lombok.Data;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class FieldDetailVO {
	private GolfFieldDto golfFieldDto;
	private List<GolfCourseDto> golfCourseDto;
}
