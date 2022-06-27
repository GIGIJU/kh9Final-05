package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.GolfFieldDto;

public interface GolfFieldDao {
	List<GolfFieldDto> selectList();
	GolfFieldDto selectOne(int fieldNo);

}
