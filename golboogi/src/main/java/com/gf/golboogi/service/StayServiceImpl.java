package com.gf.golboogi.service;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.repository.AttachmentDao;
import com.gf.golboogi.repository.StayDao;
import com.gf.golboogi.repository.StayProfileDao;

@Service
public class StayServiceImpl implements StayService {
	
	@Autowired
	private StayProfileDao stayProfileDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired 
	private StayDao stayDao;
	
	@Autowired
	SqlSession sqlSession;

	@Transactional
	@Override
	public void insert(StayDto stayDto, List<MultipartFile> stayProfile) throws IllegalStateException, IOException {
		int sequence = sqlSession.selectOne("stay.sequence");
		stayDto.setStayNo(sequence);
		
		sqlSession.insert("stay.insert", stayDto);
		
		if(!stayProfile.isEmpty()) {
			
			for(MultipartFile list : stayProfile) {
				int attachmentNo = attachmentDao.save(list);
				stayProfileDao.insert(sequence, attachmentNo);
			}
			
		}
	}
	
	// 추가분
	@Override
	public void update(StayDto stayDto, List<MultipartFile> stayProfile) {
		// TODO Auto-generated method stub
		
	}
	

}
