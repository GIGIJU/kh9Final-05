package com.gf.golboogi.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.StayDto;

public interface StayService {

	void insert(StayDto stayDto, MultipartFile stayProfile) throws IllegalStateException, IOException ;


}
