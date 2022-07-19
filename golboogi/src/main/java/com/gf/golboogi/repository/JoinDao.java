package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.JoinApplyDto;
import com.gf.golboogi.entity.JoinDto;
import com.gf.golboogi.vo.JoinListVO;
import com.gf.golboogi.vo.MyJoinApplyListVO;
import com.gf.golboogi.vo.MyJoinListVO;

public interface JoinDao {
	List<JoinListVO> selectList(String type, String keyword,int page,int size);
	void joinApply(JoinApplyDto joinApplyDto);
	int addjoinPeople(int joinApplyPeople, int joinNo);
	int count(String type, String keyword);
	void insert(JoinDto joinDto);
	List<MyJoinListVO> myJoinList(String memberId);
	int getjoinNo(int joinApplyNo);
	void joinApplyApprove(int joinApplyNo);
	void joinApplyRefuse(int joinApplyNo);
	List<MyJoinApplyListVO> myJoinApplyList(String memberId);
	void joinDelete(int joinNo);
	void joinApplyCancel(int joinApplyNo);
	JoinDto selectOne(int joinNo);
	void joinEdit(JoinDto joinDto);
}
