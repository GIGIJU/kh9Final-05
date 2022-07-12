package com.gf.golboogi.service;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.repository.AttachmentDao;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.repository.StayDao;
import com.gf.golboogi.repository.StayProfileDao;
import com.gf.golboogi.vo.KakaoPayReadyRequestVO;

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

	@Override
	public void insert(StayDto stayDto, MultipartFile stayProfile) throws IllegalStateException, IOException {
		int sequence = sqlSession.selectOne("stay.sequence");
		stayDto.setStayNo(sequence);
		sqlSession.insert("stay.insert", stayDto);
		
		if(!stayProfile.isEmpty()) {
			int attachmentNo = attachmentDao.save(stayProfile);
			stayProfileDao.insert(stayDto.getStayNo(), attachmentNo);
		}
	}
	

}
