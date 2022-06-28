package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.StayDto;

public interface StayDao {
	List<StayDto> list();
	void delete(int stayNo);
	StayDto insert(StayDto stayDto);
	StayDto update(StayDto stayDto);
	List<StayDto> findStay(String stayName);
	

}
