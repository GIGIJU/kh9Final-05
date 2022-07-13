package com.gf.golboogi.repository;

public interface NoticeProfileDao {

	void insert(int noticeNo, int attachmentNo);

	int read(int noticeNo);

}
