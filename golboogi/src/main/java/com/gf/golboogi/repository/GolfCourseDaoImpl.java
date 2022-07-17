package com.gf.golboogi.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.GolfCourseDto;

@Repository
public class GolfCourseDaoImpl implements GolfCourseDao{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void courseInsert(GolfCourseDto golfCourseDto, int fieldNo) {
		int sequence = sqlSession.selectOne("course.sequence");
		golfCourseDto.setCourseNo(sequence);
		golfCourseDto.setFieldNo(fieldNo);
		sqlSession.insert("course.insert", golfCourseDto);
		
	}
	
}
