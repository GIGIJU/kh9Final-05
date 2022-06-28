package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.GolfManagerDto;

public interface GolfManagerDao {

	List<GolfManagerDto> list();

	GolfManagerDto detail(String golfManagerId);

	boolean delete(String golfManagerId);

	void insert(GolfManagerDto golfManagerDto);


	
}
