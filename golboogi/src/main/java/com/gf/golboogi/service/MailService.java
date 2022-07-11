package com.gf.golboogi.service;

import javax.mail.MessagingException;

import com.gf.golboogi.entity.MemberDto;

public interface MailService {
	void sendPasswordResetMail(MemberDto findDto) throws MessagingException;
}
