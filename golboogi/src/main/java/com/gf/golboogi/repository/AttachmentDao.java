package com.gf.golboogi.repository;

import java.io.IOException;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.AttachmentDto;

public interface AttachmentDao {
	
	int save(MultipartFile attachement) throws IllegalStateException, IOException;

	AttachmentDto info(int attachmentNo);

	ByteArrayResource load(String attachmentSavename) throws IOException;

	//memberProfile update
	int update(MultipartFile memberProfile, String memberId) throws IllegalStateException, IOException;

	//reviewProfile update
	int update(int reviewNo, MultipartFile reviewProfile) throws IllegalStateException, IOException;

	
}
