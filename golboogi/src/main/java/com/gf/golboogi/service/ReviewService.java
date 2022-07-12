package com.gf.golboogi.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.ReviewDto;

public interface ReviewService {

	void write(ReviewDto reviewDto, MultipartFile reviewProfile) throws IllegalStateException, IOException;

	void changeProfile(int reviewNo, MultipartFile reviewProfile) throws IllegalStateException, IOException;
}
