package com.gf.golboogi.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.GolfFieldDto;

public interface GolfFieldService {

	void insert(GolfFieldDto golfFieldDto, MultipartFile fieldProfile) throws IllegalStateException, IOException;

}
