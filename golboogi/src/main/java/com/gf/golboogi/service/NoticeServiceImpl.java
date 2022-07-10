package com.gf.golboogi.service;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.NoticeDto;
import com.gf.golboogi.repository.AttachmentDao;
import com.gf.golboogi.repository.MemberProfileDao;
import com.gf.golboogi.repository.NoticeDao;
import com.gf.golboogi.repository.NoticeProfileDao;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private NoticeProfileDao noticeProfileDao;

	@Override
	public void write(NoticeDto noticeDto, MultipartFile noticeProfile) throws IllegalStateException, IOException {
		noticeDao.write(noticeDto);
		
		//프로필 등록 코드 추가(실제 저장 + DB 처리) - Attachment , MemberProfile 테이블
		if(!noticeProfile.isEmpty()) {
			int attachmentNo = attachmentDao.save(noticeProfile);
			noticeProfileDao.insert(noticeDto.getNoticeNo(), attachmentNo);
		}
	}
	
}
