package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.vo.GolfManagerVO;

public interface GolfManagerDao {

	List<GolfManagerVO> list(String golfManagerId);

}
