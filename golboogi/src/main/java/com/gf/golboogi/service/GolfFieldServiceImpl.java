package com.gf.golboogi.service;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.GolfCourseDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.repository.AttachmentDao;
import com.gf.golboogi.repository.FieldProfileDao;
import com.gf.golboogi.repository.GolfCourseDao;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.vo.GolfFieldVO;

@Service
public class GolfFieldServiceImpl implements GolfFieldService {
	
	@Autowired
	private GolfFieldDao golfFieldDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private FieldProfileDao fieldProfileDao;
	
	@Autowired
	private GolfCourseDao golfCourseDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Transactional
	@Override
	public void insert(GolfFieldDto golfFieldDto, List<String> courseName, List<MultipartFile> fieldProfile)
			throws IllegalStateException, IOException {
		
		int fieldNo = sqlSession.selectOne("golfField.sequence");
		golfFieldDto.setFieldNo(fieldNo);
		
		//골프장추가
		golfFieldDao.fieldInsert(golfFieldDto);
		//코스추가
		for(String name : courseName) {
			int courseNo = sqlSession.selectOne("course.sequence");
			GolfCourseDto courseDto = new GolfCourseDto();
			courseDto.setCourseName(name);
			courseDto.setFieldNo(fieldNo);
			courseDto.setCourseNo(courseNo);
			golfCourseDao.courseInsert(courseDto);
			//티타임 추가
			golfFieldDao.teetimeInsert(courseNo);
		}
		
		if(!fieldProfile.isEmpty()) {
			for(MultipartFile list : fieldProfile) {
				int attachmentNo = attachmentDao.save(list);
				fieldProfileDao.insert(fieldNo, attachmentNo);
			}
			
		}
		
	}

	@Override
	public List<GolfFieldVO> selectFieldList() {
		return sqlSession.selectList("golfField.fieldList");
	}



}