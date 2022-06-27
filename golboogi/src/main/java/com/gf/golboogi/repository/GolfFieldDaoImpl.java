package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.GolfFieldDto;

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
	
	
	
}
