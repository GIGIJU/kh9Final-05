package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.gf.golboogi.entity.StayDto;
//import com.gf.golboogi.error.CannotFindException;

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
	
	//숙소 검색 
	@Override
	public StayDto find(int stayNo) {
		return sqlSession.selectOne("stay.one",stayNo);
	}
	
	//숙소 등록
	@Override
	public StayDto insert(StayDto stayDto) {
		long sequence = sqlSession.selectOne("stay.sequence");
		//stayDto.setStayNo(sequence);
		sqlSession.insert("stay.insert", stayDto);
		return stayDto;
	}
	
	//숙소 수정 
	@Override
	public StayDto update(StayDto stayDto) {
		int count = sqlSession.update("stay.update", stayDto);
		//if(count == 0) throw new CannotFindException();
		return sqlSession.selectOne("stay.one", stayDto.getStayNo());
	}



}
