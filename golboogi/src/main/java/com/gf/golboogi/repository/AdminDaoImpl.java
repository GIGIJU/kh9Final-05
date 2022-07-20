package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.GolfManagerDto;
import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.vo.AdminVO;
import com.gf.golboogi.vo.FieldDetailVO;

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

	@Override
	public void insertManager(AdminVO adminVO) {
		sqlSession.insert("admin.insertManager", adminVO);
	}

	@Override
	public boolean MyCheck(String golfManagerId) {
		GolfManagerDto findDto = sqlSession.selectOne("admin.myCheck",golfManagerId);
		boolean adminCheck = findDto.getGolfManagerGrade() == 0;
		if(adminCheck) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public String golfManagerCheck(String adminId) {
		return sqlSession.selectOne("admin.managerCheck",adminId);
	}
	
	// 추가분

	@Override
	public void infoEditVO(FieldDetailVO fieldDetailVO) {
		// TODO Auto-generated method stub
		
	}

}
