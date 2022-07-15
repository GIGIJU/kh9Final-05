package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.NoticeDto;
import com.gf.golboogi.vo.NoticeProfileListVO;

public interface NoticeDao {

	List<NoticeProfileListVO> list(String keyword, int page, int size);

	int count(String keyword);

	NoticeDto read(int noticeNo);

	NoticeDto info(int noticeNo);

	boolean edit(NoticeDto noticeDto);

	boolean delete(int noticeNo);

	void write(NoticeDto noticeDto);

}
