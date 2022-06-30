package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.GolfManagerDto;
import com.gf.golboogi.vo.AdminVO;

public interface AdminDao {

	List<AdminVO> list();

	AdminVO detail(String golfManagerId);

	boolean delete(String golfManagerId);

	void insert(GolfManagerDto golfManagerDto);


}
