package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StayProfileDaoImpl implements StayProfileDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(int stayNo, int attachmentNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("stayNo", stayNo);
		param.put("attachmentNo", attachmentNo);
		sqlSession.insert("stayProfile.insert", param);
		
	}

}
