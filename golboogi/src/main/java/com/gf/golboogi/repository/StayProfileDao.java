package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.vo.StayProfileVO;

public interface StayProfileDao {
	void insert(int stayNo, int attachmentNo);

	// 추가분
	List<StayProfileVO> multiInfo(int stayNo);
}
