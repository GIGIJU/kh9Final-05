package com.gf.golboogi.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.repository.AttachmentDao;
import com.gf.golboogi.repository.FieldProfileDao;
import com.gf.golboogi.repository.GolfFieldDao;

@Service
public class GolfFieldServiceImpl implements GolfFieldService {
	
	@Autowired
	private GolfFieldDao golfFieldDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private FieldProfileDao fieldProfileDao;
	
	@Transactional
	@Override
	public void insert(GolfFieldDto golfFieldDto, List<MultipartFile> fieldProfile) throws IllegalStateException, IOException {
		golfFieldDao.insert(golfFieldDto);
		if(!fieldProfile.isEmpty()) {
			
			for(MultipartFile list : fieldProfile) {
				int attachmentNo = attachmentDao.save(list);
				fieldProfileDao.insert(golfFieldDto.getFieldNo(), attachmentNo);
			}
			
		}
	}

//	@Override
//	public void fieldInsert(GolfFieldDto golfFieldDto, List<MultipartFile> fieldProfile)
//			throws IllegalStateException, IOException {
//		golfFieldDao.fieldInsert(golfFieldDto);
//		if(!fieldProfile.isEmpty()) {
//			
//			for(MultipartFile list : fieldProfile) {
//				int attachmentNo = attachmentDao.save(list);
//				fieldProfileDao.insert(golfFieldDto.getFieldNo(), attachmentNo);
//			}
//			
//		}
//	}
	
//	@Transactional
//	@Override
//	public void insert(GolfFieldDto golfFieldDto, MultipartFile fieldProfile) throws IllegalStateException, IOException {
//		golfFieldDao.insert(golfFieldDto);
//		
//		if(!fieldProfile.isEmpty()) {
//			int attachmentNo = attachmentDao.save(fieldProfile);
//			fieldProfileDao.insert(golfFieldDto.getFieldNo(), attachmentNo);
//		}
//	}

}
