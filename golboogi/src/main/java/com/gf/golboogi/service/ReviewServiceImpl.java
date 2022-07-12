package com.gf.golboogi.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.ReviewDto;
import com.gf.golboogi.repository.AttachmentDao;
import com.gf.golboogi.repository.ReviewDao;
import com.gf.golboogi.repository.ReviewProfileDao;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private ReviewProfileDao reviewProfileDao;
	
	@Override
	public void write(ReviewDto reviewDto, MultipartFile reviewProfile) throws IllegalStateException, IOException {
		reviewDao.write(reviewDto);
		
		//프로필 등록 코드 추가(실제 저장 + DB 처리) - Attachment , MemberProfile 테이블
		if(!reviewProfile.isEmpty()) {
			int attachmentNo = attachmentDao.save(reviewProfile);
			reviewProfileDao.insert(reviewDto.getReviewNo(), attachmentNo);
		}
		
	}

	@Override
	public void changeProfile(int reviewNo, MultipartFile reviewProfile) throws IllegalStateException, IOException {
		int findNo = reviewProfileDao.read(reviewNo);
		if(findNo == 0) {
			int attachmentNo = attachmentDao.save(reviewProfile);
			reviewProfileDao.insert(reviewNo, attachmentNo);
		}else {
			attachmentDao.update(reviewNo,reviewProfile);
		}
	}

}
