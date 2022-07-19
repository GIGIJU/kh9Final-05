package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.GolfCourseDto;

@Repository
public class GolfCourseDaoImpl implements GolfCourseDao{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void courseInsert(GolfCourseDto golfCourseDto) {
		int sequence = sqlSession.selectOne("course.sequence");//이거 이상하다 고쳐야할듯?
		sqlSession.insert("course.insert", golfCourseDto);
		
	}

	@Override
	public List<GolfCourseDto> courseList() {
		return sqlSession.selectList("course.courseList");
	}
	
	//추가분

	@Override
	public List<GolfCourseDto> searchCourseList(int fieldNo) {
		return sqlSession.selectList("course.searchCourseList", fieldNo);
	}

	
}