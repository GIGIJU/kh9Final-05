package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.vo.JoinListVO;

@Repository
public class JoinDaoImpl implements JoinDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<JoinListVO> selectList() {
		return sqlSession.selectList("join.list");
	}

}
