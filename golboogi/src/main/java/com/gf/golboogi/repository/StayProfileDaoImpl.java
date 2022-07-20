package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.vo.FieldProfileVO;
import com.gf.golboogi.vo.StayProfileVO;

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
	
	@Override
	public int oneP(int stayNo) {
		Integer attachmentNo = sqlSession.selectOne("stayProfile.one", stayNo);
		if(attachmentNo == null) {
			return 0;
		}else {
			return attachmentNo;
		}
	}


	@Override
	public List<StayProfileVO> profileOne(int stayNo) {
		System.out.println("stayNo >>>" + stayNo);
		List<StayProfileVO> list = sqlSession.selectList("stayProfile.profileOne", stayNo);
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}

}
