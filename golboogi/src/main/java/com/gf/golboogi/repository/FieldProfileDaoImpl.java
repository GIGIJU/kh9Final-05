package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.vo.FieldProfileVO;

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

	@Override
	public int info(int fieldNo) {
		Integer attachmentNo = sqlSession.selectOne("fieldProfile.one", fieldNo);
		if(attachmentNo == null) {
			return 0;
		}else {
			return attachmentNo;
		}
	}

	
	@Override
	public List<FieldProfileVO> multiInfo(int fieldNo) {
		List<FieldProfileVO> list = sqlSession.selectList("fieldProfile.multiInfo", fieldNo);
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}


	
	
}
