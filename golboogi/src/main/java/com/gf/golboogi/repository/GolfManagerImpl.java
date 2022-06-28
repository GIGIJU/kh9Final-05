package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.GolfManagerDto;

@Repository
public class GolfManagerImpl implements GolfManagerDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GolfManagerDto> list() {
		return sqlSession.selectList("golfManager.list");
	}

	@Override
	public GolfManagerDto detail(String golfManagerId) {
		return sqlSession.selectOne("golfManager.one", golfManagerId);
	}

	@Override
	public boolean delete(String golfManagerId) {
		int count = sqlSession.delete("golfManager.delete", golfManagerId);
		return count > 0;
	}

	@Override
	public void insert(GolfManagerDto golfManagerDto) {
		sqlSession.insert("golfManager.insert", golfManagerDto);
	}

	
	
}
