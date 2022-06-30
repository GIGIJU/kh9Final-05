package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.GolfManagerDto;
import com.gf.golboogi.vo.AdminVO;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AdminVO> list() {
		return sqlSession.selectList("admin.list");
	}

	@Override
	public AdminVO detail(String golfManagerId) {
		return sqlSession.selectOne("admin.one", golfManagerId);
	}

	@Override
	public boolean delete(String golfManagerId) {
		int count = sqlSession.delete("admin.delete", golfManagerId);
		return count > 0;
	}

	@Override
	public void insert(GolfManagerDto golfManagerDto) {
		sqlSession.insert("admin.insert", golfManagerDto);
	}


}
