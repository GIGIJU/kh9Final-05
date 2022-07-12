package com.gf.golboogi.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.repository.AttachmentDao;
import com.gf.golboogi.repository.MemberDao;
import com.gf.golboogi.repository.MemberProfileDao;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;
		
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;
	
	@Transactional
	@Override
	public void join(MemberDto memberDto, MultipartFile memberProfile) throws IllegalStateException, IOException {
		memberDao.join(memberDto);
		
		//프로필 등록 코드 추가(실제 저장 + DB 처리) - Attachment , MemberProfile 테이블
		if(!memberProfile.isEmpty()) {
			int attachmentNo = attachmentDao.save(memberProfile);
			memberProfileDao.insert(memberDto.getMemberId(), attachmentNo);
		}
	}

	@Override
	public void changeProfile(String memberId, MultipartFile memberProfile) throws IllegalStateException, IOException {
		int findNo = memberProfileDao.info(memberId);
		if(findNo == 0) {
			int attachmentNo = attachmentDao.save(memberProfile);
			memberProfileDao.insert(memberId, attachmentNo);
		}else {
			attachmentDao.update(memberProfile,memberId);
		}
		
	}

}
