package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewProfileDaoImpl implements ReviewProfileDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(int reviewNo, int attachmentNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("reviewNo", reviewNo);
		param.put("attachmentNo", attachmentNo);
		sqlSession.insert("reviewProfile.insert", param);
	}

	@Override
	public int read(int reviewNo) {
		Integer attachmentNo = sqlSession.selectOne("reviewProfile.one",reviewNo);
		if(attachmentNo == null) {
			return 0;
		}else {
			return attachmentNo;
		}
	}

	
}
