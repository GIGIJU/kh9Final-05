package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.LikeDto;

public interface LikeDao {

	LikeDto insert(LikeDto likeDto);

	List<LikeDto> list(int likeTinfo);

}
