package com.gf.golboogi.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.GolfCourseDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.vo.FieldDetailVO;
import com.gf.golboogi.vo.GolfFieldVO;

public interface GolfFieldService {

	void insert(GolfFieldDto golfFieldDto, GolfCourseDto golfCourseDto, List<MultipartFile> fieldProfile) throws IllegalStateException, IOException;

	List<GolfFieldVO> selectFieldList();
	
	//추가분
//	void insert(GolfFieldDto golfFieldDto, GolfCourseDto golfCourseDto, List<MultipartFile> fieldProfile) throws IllegalStateException, IOException;
	
	void update(int fieldNo, List<MultipartFile> fieldProfile) throws IllegalStateException, IOException;

	void insertVO(FieldDetailVO fieldDetailVO, List<MultipartFile> fieldProfile) throws IllegalStateException, IOException;



}