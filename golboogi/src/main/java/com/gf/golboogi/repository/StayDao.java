package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.StayDto;

public interface StayDao {
	List<StayDto> list(); //숙소목록
	void delete(int stayNo); //숙소삭제
	StayDto insert(StayDto stayDto); //숙소등록
	StayDto update(StayDto stayDto); //숙소수정
	StayDto find(int stayNo); //숙소검색
	

}
