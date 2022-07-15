package com.gf.golboogi.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.GolfCourseDto;
import com.gf.golboogi.entity.GolfFieldDto;

public interface AdminInsertService {

	void fieldInsert(GolfFieldDto golfFieldDto, List<MultipartFile> fieldProfile) throws IllegalStateException, IOException;

}
