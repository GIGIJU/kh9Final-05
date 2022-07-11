package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FieldProfileDaoImpl implements FieldProfileDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(int fieldNo, int attachmentNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("fieldNo", fieldNo);
		param.put("attachmentNo", attachmentNo);
		sqlSession.insert("fieldProfile.insert", param);
	}
	
	
}
