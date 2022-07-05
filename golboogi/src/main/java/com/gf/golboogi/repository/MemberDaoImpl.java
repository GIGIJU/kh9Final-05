package com.gf.golboogi.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public void join(MemberDto memberDto) {
		String rawPassword = memberDto.getMemberPw();
		String encryptPassword = passwordEncoder.encode(rawPassword);
		memberDto.setMemberPw(encryptPassword);
		sqlSession.insert("member.join", memberDto);
	}

	@Override
	public MemberDto login(String memberId, String memberPw) {
		MemberDto memberDto = sqlSession.selectOne("member.one", memberId);
		if(memberDto == null) {
			return null;
		}
		
//		boolean isPasswordMatch = MemberDto.getmemberPw().equals(memberPw);
		boolean isPasswordMatch = passwordEncoder.matches(memberPw, memberDto.getMemberPw());
		if(isPasswordMatch) {
			sqlSession.update("member.updateLogin", memberId);
			return memberDto;
		}
		else {
			return null;
		}
		
	}

	@Override
	public MemberDto info(String memberId) {
		MemberDto memberDto = sqlSession.selectOne("member.one",memberId);
		if(memberDto == null) {
			return null;
		}
		return memberDto;
	}

	@Override
	public boolean changeInformation(MemberDto memberDto) {
		return sqlSession.update("member.changeInfo",memberDto) > 0;
	}

	@Override
	public boolean ChangePassword(String memberId, String memberPw, String changePw) {
		MemberDto memberDto = this.login(memberId, memberPw);//현재 정보로 검사
		if(memberDto == null) {
			return false;
		}
		
		//비밀번호 암호화 코드를 추가
		String encodePassword = passwordEncoder.encode(changePw);
		
		int count = sqlSession.update("member.changePw", 
				memberDto.builder().memberId(memberId).memberPw(encodePassword).build());
		
		return count > 0;
	}
	
	@Override
	public boolean exit(String memberId, String memberPw) {
		return sqlSession.delete("member.exit",memberId) > 0;
	}
	
	@Override
	public String findId(MemberDto memberDto) {
		MemberDto findDto = sqlSession.selectOne("member.findId",memberDto);
		if(findDto == null) {
			return null;
		}else {
			return findDto.getMemberId();
		}
	}

	@Override
	public MemberDto findPw(MemberDto memberDto) {
		return sqlSession.selectOne("member.findPw",memberDto);
	}
	
	@Override
	public boolean changPassword(MemberDto memberDto) {
		// 암호화를 거친 뒤 등록될 수 있도록 처리
		// 현재 MemberDto 파라미터에는 암호화 전단계의 비밀번호와 아이디가 있다.
		String rawPassword = memberDto.getMemberPw();
		String encryptPassword = passwordEncoder.encode(rawPassword);
		memberDto.setMemberPw(encryptPassword);
		int count = sqlSession.update("member.changePw",memberDto);
		return count > 0;
	}

	@Override
	public MemberDto selectNick(String memberNick) {
		return sqlSession.selectOne("member.selectNick",memberNick);
	}

	@Override
	public MemberDto selectPhone(String memberPhone) {
		return sqlSession.selectOne("member.selectPhone",memberPhone);
	}
	
}
