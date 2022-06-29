package com.gf.golboogi.repository;

import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.GolfCourseDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.TeetimeDto;
import com.gf.golboogi.vo.Teetime1VO;

@Repository
public class GolfFieldDaoImpl implements GolfFieldDao{

	
	@Autowired
	private SqlSession sqlSession;

	//골프장 리스트 출력
	@Override
	public List<GolfFieldDto> selectList() {
		return sqlSession.selectList("golfFeild.list");
	}

	//골프장 상세 출력
	@Override
	public GolfFieldDto selectOne(int fieldNo) {
		return sqlSession.selectOne("golfFeild.one",fieldNo);
	}


	//한 골프장의 티타임 리스트 출력
	@Override
	public List<TeetimeDto> selectTeetimeList(int fieldNo) {
		return sqlSession.selectList("teetime.list",fieldNo);
	}

	//골프장 , 코스 정보 출력
	@Override
	public Teetime1VO selectCourse(int teeTimeNo) {
		return sqlSession.selectOne("teetime.one",teeTimeNo);
	}


	@Override
	public void teetimeInsert(int courseNo) {
		// TODO Auto-generated method stub
		
	}

	
	
	
}
