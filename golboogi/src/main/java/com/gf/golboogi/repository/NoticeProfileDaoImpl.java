package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeProfileDaoImpl implements NoticeProfileDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(int noticeNo, int attachmentNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("noticeNo", noticeNo);
		param.put("attachmentNo", attachmentNo);
		sqlSession.insert("noticeProfile.insert", param);
	}

	@Override
	public int read(int noticeNo) {
		Integer attachmentNo = sqlSession.selectOne("noticeProfile.one",noticeNo);
		if(attachmentNo == null) {
			return 0;
		}else {
			return attachmentNo;
		}
	}

	
}
