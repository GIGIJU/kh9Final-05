package com.gf.golboogi.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MemberDto {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberNick;
	private String memberPhone;
	private String memberEmail;
	private Date memberBirth;
	private String memberGender;
	private String memberLocal;
	private int memberScore;
	private int memberGrade;
	private Date memberJoindate;
	private Date memberLogindate;
}
