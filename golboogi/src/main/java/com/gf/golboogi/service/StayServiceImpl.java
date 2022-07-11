package com.gf.golboogi.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.repository.StayDao;
import com.gf.golboogi.vo.KakaoPayReadyRequestVO;

@Service
public class StayServiceImpl implements StayService {

	@Autowired 
	private StayDao stayDao;
	
	@Autowired
	SqlSession sqlSession;
	
	@Transactional
	@Override
	public void insert(StayDto stayDto, MultipartFile stayProfile) {
		int sequence = sqlSession.selectOne("stay.sequence");
		
		stayDto.setStayNo(sequence);
		System.out.println("DTO : " + stayDto);
		
		stayDao.insert(stayDto);
		System.out.println("DTO : " + stayDto);
		
		
//		if(!stayProfile.isEmpty()) {
//			int attachmentNo = attachmentDao.save(stayProfile);
//			stayProfileDao.insert(여기 수정 필요golfFieldDto.getFieldNo(), attachmentNo);
//		}
	}

}
