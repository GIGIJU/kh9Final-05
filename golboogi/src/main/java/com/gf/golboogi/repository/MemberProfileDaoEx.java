package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberProfileDaoEx implements MemberProfileDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(String memberId, int attachmentNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("attachmentNo", attachmentNo);
		sqlSession.insert("memberProfile.insert", param);
	}

	@Override
	public int info(String memberId) {
		Integer attachmentNo = sqlSession.selectOne("memberProfile.one",memberId);
		if(attachmentNo == null) {
			return 0;
		}else {
			return attachmentNo;
		}
	}

}