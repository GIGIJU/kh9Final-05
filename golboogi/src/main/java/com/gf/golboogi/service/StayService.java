package com.gf.golboogi.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.StayDto;

public interface StayService {

	void insert(StayDto stayDto, List<MultipartFile> fieldProfile) throws IllegalStateException, IOException ;


}
