package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.GolfCourseDto;

public interface GolfCourseDao {

	void courseInsert(GolfCourseDto golfCourseDto);

	List<GolfCourseDto> courseList();

	//추가분
	List<GolfCourseDto> searchCourseList(int fieldNo);

	
}