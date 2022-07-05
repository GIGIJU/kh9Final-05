package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.StayDto;


public interface StayDao {
	List<StayDto> list(); //숙소목록
	boolean delete(int stayNo); //숙소삭제
	StayDto insert(StayDto stayDto); //숙소등록
	StayDto infoEdit(StayDto stayDto); //숙소정보수정
	//StayDto priceEdit(StayDto stayDto); //숙소가격수정
	StayDto find(String stayName); //숙소명 검색 
	StayDto one(int stayNo); //숙소번호 검색

	
	
	

}
