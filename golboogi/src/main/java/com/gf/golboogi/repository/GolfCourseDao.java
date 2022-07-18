package com.gf.golboogi.repository;

import com.gf.golboogi.entity.GolfCourseDto;

public interface GolfCourseDao {

	void courseInsert(GolfCourseDto golfCourseDto, int fieldNo);
	
}