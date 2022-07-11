package com.gf.golboogi.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.MemberDto;

public interface MemberService {
	void join(MemberDto memberDto, MultipartFile memberProfile)throws IllegalStateException, IOException;
}
