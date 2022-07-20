package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.vo.StayProfileVO;

public interface StayProfileDao {
	void insert(int stayNo, int attachmentNo);

	List<StayProfileVO> profileOne(int stayNo);
	int oneP(int stayNo);
	// 추가분
	List<StayProfileVO> multiInfo(int stayNo);

}
