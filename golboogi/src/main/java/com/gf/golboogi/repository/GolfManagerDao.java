package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.GolfManagerDto;
import com.gf.golboogi.vo.GolfManagerVO;

public interface GolfManagerDao {

	List<GolfManagerVO> list();

	GolfManagerDto detail(String golfManagerId);

	boolean delete(String golfManagerId);

	void insert(GolfManagerDto golfManagerDto);



	
}
