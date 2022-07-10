package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.AttachmentDto;

public interface NoticeProfileDao {

	void insert(int noticeNo, int attachmentNo);

	int read(int noticeNo);

	List<AttachmentDto> readList();
}
