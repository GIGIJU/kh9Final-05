package com.gf.golboogi.repository;

import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.TeetimeDto;

@Repository
public class GolfFieldDaoImpl implements GolfFieldDao{

	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GolfFieldDto> selectList() {
		return sqlSession.selectList("golfFeild.list");
	}

	@Override
	public GolfFieldDto selectOne(int fieldNo) {
		return sqlSession.selectOne("golfFeild.one",fieldNo);
	}

	@Override
	public void teetimeInsert(int courseNo) {
		
		SimpleDateFormat f = new SimpleDateFormat("HH:mm");
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<TeetimeDto> selectTeetimeList(int fieldNo) {
		return sqlSession.selectList("teetime.list",fieldNo);
	}
	
	
	
}
