package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.error.CannotFindException;


@Repository
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
	public boolean delete(int stayNo) {
		return sqlSession.delete("stay.delete", stayNo) > 0;
	}
	
	//숙소명 검색 
	@Override
	public StayDto find(String stayName) {
		return sqlSession.selectOne("stay.find",stayName);
	}
	
	//숙소 등록
	@Override
	public StayDto insert(StayDto stayDto) {
		int sequence = sqlSession.selectOne("stay.sequence");
		stayDto.setStayNo(sequence);
		sqlSession.insert("stay.insert", stayDto);
		return stayDto;
	}
	
	//숙소 정보수정
	@Override
	public StayDto infoEdit(StayDto stayDto) {
		int count = sqlSession.update("stay.infoEdit", stayDto);
		if(count == 0) throw new CannotFindException();
		return sqlSession.selectOne("stay.one", stayDto.getStayNo());
	}
	
	//숙소번호 검색
	@Override
	public StayDto one(int stayNo) {
		return sqlSession.selectOne("stay.one",stayNo);
	}

	//상세보기 + 이미지
	@Override
	public StayDto oneProfile(int stayNo) {
		return sqlSession.selectOne("stay.oneProfile",stayNo);
	}




}
