package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.GolfManagerDto;
import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.vo.AdminVO;
import com.gf.golboogi.vo.FieldDetailVO;

public interface AdminDao {

	List<AdminVO> list();

	AdminVO detail(String golfManagerId);

	boolean delete(String golfManagerId);

	void insert(GolfManagerDto golfManagerDto);

	List<MemberDto> memberList();

	MemberDto memberDetail(String memberId);

	boolean blacklist(MemberDto memberDto);

	GolfManagerDto login(String golfManagerId, String golfManagerPw);

	void insertManager(AdminVO adminVO);

	//관리자 로그인 아이디가 본인인지 확인
	boolean MyCheck(String golfManagerId);

	String golfManagerCheck(String adminId);

	
//	추가분 
	void infoEditVO(FieldDetailVO fieldDetailVO);

 



}
