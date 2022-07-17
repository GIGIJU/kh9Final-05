package com.gf.golboogi.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.GolfCourseDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.repository.AttachmentDao;
import com.gf.golboogi.repository.FieldProfileDao;
import com.gf.golboogi.repository.GolfFieldDao;

@Service
public class AdminInsertServiceImpl implements AdminInsertService {
	
	@Autowired
	private FieldProfileDao fieldProfileDao;
	@Autowired
	private GolfFieldDao golfFieldDao;
	@Autowired
	private AttachmentDao attachmentDao;
	
	
	

	@Override
	public void fieldInsert(GolfFieldDto golfFieldDto, List<MultipartFile> fieldProfile)
			throws IllegalStateException, IOException {
		golfFieldDao.fieldInsert(golfFieldDto);
		
		
		if(!fieldProfile.isEmpty()) {
			
			for(MultipartFile list : fieldProfile) {
				int attachmentNo = attachmentDao.save(list);
				fieldProfileDao.insert(golfFieldDto.getFieldNo(), attachmentNo);
			}
			
		}
		
	}


}
