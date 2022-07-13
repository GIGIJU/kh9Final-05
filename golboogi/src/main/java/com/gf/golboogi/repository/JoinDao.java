package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.JoinApplyDto;
import com.gf.golboogi.entity.JoinDto;
import com.gf.golboogi.vo.JoinListVO;

public interface JoinDao {
	List<JoinListVO> selectList(String type, String keyword,int page,int size);
	void joinApply(JoinApplyDto joinApplyDto);
	int addjoinPeople(int joinApplyPeople, int joinNo);
	int count(String type, String keyword);
	void insert(JoinDto joinDto);
}
