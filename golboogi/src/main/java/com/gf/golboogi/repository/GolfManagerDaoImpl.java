package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.vo.GolfManagerVO;

@Repository
public class GolfManagerDaoImpl implements GolfManagerDao{

	@Autowired SqlSession sqlSession;
	
	@Override
	public List<GolfManagerVO> list(String golfManagerId) {
		return sqlSession.selectList("manager.list", golfManagerId);
	}
	
}
