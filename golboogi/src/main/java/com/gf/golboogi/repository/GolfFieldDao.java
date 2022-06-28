package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.TeetimeDto;

public interface GolfFieldDao {
	List<GolfFieldDto> selectList();
	GolfFieldDto selectOne(int fieldNo);
	void teetimeInsert(int courseNo);
	List<TeetimeDto> selectTeetimeList(int fieldNo);

}
