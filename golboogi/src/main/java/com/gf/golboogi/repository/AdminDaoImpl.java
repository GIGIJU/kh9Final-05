package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.GolfManagerDto;
import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.vo.AdminVO;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public List<AdminVO> list() {
		return sqlSession.selectList("admin.list");
	}

	@Override
	public AdminVO detail(String golfManagerId) {
		return sqlSession.selectOne("admin.one", golfManagerId);
	}

	@Override
	public boolean delete(String golfManagerId) {
		int count = sqlSession.delete("admin.delete", golfManagerId);
		return count > 0;
	}

	@Override
	public void insert(GolfManagerDto golfManagerDto) {
		String rawPassword = golfManagerDto.getGolfManagerPw();
		String encryptPassword = passwordEncoder.encode(rawPassword);
		golfManagerDto.setGolfManagerPw(encryptPassword);
		sqlSession.insert("admin.insert", golfManagerDto);
	}

	@Override
	public List<MemberDto> memberList() {
		return sqlSession.selectList("admin.memberList");
	}

	@Override
	public MemberDto memberDetail(String memberId) {
		return sqlSession.selectOne("admin.memberOne", memberId);
	}

	@Override
	public boolean blacklist(MemberDto memberDto) {
		return sqlSession.update("admin.blacklist", memberDto) > 0;
	}

	@Override
	public GolfManagerDto login(String golfManagerId, String golfManagerPw) {
		GolfManagerDto golfManagerDto = sqlSession.selectOne("admin.oneForLogin", golfManagerId);
		if(golfManagerDto == null) {
			return null;
		}
		
		boolean isPasswordMatch = passwordEncoder.matches(golfManagerPw, golfManagerDto.getGolfManagerPw());
		if(isPasswordMatch) {
			return golfManagerDto;
		} else {
			return null;
		}
		
	}

	




}
