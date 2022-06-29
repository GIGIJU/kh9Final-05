package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.NoticeDto;

public interface NoticeDao {

	List<NoticeDto> list(String keyword, int page, int size);

	int count(String keyword);

	void write(String noticeHead,String noticeTitle);

	NoticeDto read(int noticeNo);

	NoticeDto info(int noticeNo);

	boolean edit(NoticeDto noticeDto);

	boolean delete(int noticeNo);
	

}
