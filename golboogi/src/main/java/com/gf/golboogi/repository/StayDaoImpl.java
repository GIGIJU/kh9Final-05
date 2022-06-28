package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.gf.golboogi.entity.StayDto;

public class StayDaoImpl implements StayDao{
	@Autowired
	private SqlSession sqlSession;
	
	//숙소 목록 
	@Override
	public List<StayDto> list() {
		return sqlSession.selectList("stay.list");
	}
	
	//숙소 삭제
	@Override
	public void delete(int stayNo) {
		sqlSession.delete("stay.delete", stayNo);
	}
	
	//숙소 등록
	@Override
	public StayDto insert(StayDto stayDto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//숙소 업데이트 
	@Override
	public StayDto update(StayDto stayDto) {
		// TODO Auto-generated method stub
		return null;
	}

	//숙소 검색 
	@Override
	public List<StayDto> findStay(String stayName) {
		return sqlSession.selectList("exam.findStay",stayName);
	}

}
