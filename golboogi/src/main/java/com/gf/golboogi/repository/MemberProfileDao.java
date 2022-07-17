package com.gf.golboogi.repository;

public interface MemberProfileDao {
	void insert(String memberId, int attachmentNo);

	//단일 검색
	int info(String memberId);

	String MyCheck(String memberId);

}
