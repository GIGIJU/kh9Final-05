package com.gf.golboogi.repository;

import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.vo.MemberProfileVO;

public interface MemberDao {

	void join(MemberDto memberDto);

	MemberDto login(String memberId, String memberPw);

	MemberDto info(String memberId);

	boolean changeInformation(MemberDto memberDto);

	boolean ChangePassword(String memberId, String memberPw, String changePw);

	boolean exit(String memberId, String memberPw);

	String findId(MemberDto memberDto);

	MemberDto findPw(MemberDto memberDto);

	boolean changPassword(MemberDto memberDto);

	MemberDto selectNick(String memberNick);

	MemberDto selectPhone(String memberPhone);


}
