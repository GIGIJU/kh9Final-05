package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.GolfCourseDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.TeetimeDto;
import com.gf.golboogi.vo.Teetime1VO;

public interface GolfFieldDao {
	List<GolfFieldDto> selectList();
	GolfFieldDto selectOne(int fieldNo);
	void teetimeInsert(int courseNo);
	List<TeetimeDto> selectTeetimeList(int fieldNo);
	Teetime1VO selectCourse(int teeTimeNo);


}
