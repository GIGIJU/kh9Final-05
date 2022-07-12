package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.JoinApplyDto;
import com.gf.golboogi.entity.JoinDto;
import com.gf.golboogi.vo.JoinListVO;

@Repository
public class JoinDaoImpl implements JoinDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<JoinListVO> selectList(String type, String keyword,int page,int size) {
		Map<String, Object> param = new HashMap<>();
		
		param.put("type", type);
		param.put("keyword", keyword);
		
		int end = page * size;
		int begin = end - (size - 1);
		param.put("begin", begin);
		param.put("end", end);
		
		return sqlSession.selectList("join.list",param);
	}

	//조인 신청
	@Override
	public void joinApply(JoinApplyDto joinApplyDto) {
		int joinApplyNo = sqlSession.selectOne("join.applySequence");
		joinApplyDto.setJoinApplyNo(joinApplyNo);
		
		sqlSession.insert("join.applyInsert",joinApplyDto);
		
	}

	//조인 승인 시 인원 추가
	@Override
	public int addjoinPeople(int joinApplyPeople, int joinNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("joinApplyPeople", joinApplyPeople);
		param.put("joinNo", joinNo);
		
		return sqlSession.update("join.addJoinPeople",param);
	}

	//페이지네이션을 위한 count
	@Override
	public int count(String type, String keyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectOne("join.count", param);
	}

	//조인 등록
	@Override
	public void insert(JoinDto joinDto) {
		int joinNo = sqlSession.selectOne("join.sequence");
		joinDto.setJoinNo(joinNo);
		
		sqlSession.insert("join.insert",joinDto);
		
	}

}
