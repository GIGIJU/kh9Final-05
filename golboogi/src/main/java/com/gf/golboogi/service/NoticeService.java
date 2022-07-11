package com.gf.golboogi.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.NoticeDto;

public interface NoticeService {

	void write(NoticeDto noticeDto, MultipartFile noticeProfile) throws IllegalStateException, IOException;

}
