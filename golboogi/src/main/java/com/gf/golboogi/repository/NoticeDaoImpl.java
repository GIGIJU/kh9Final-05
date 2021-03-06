package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.NoticeDto;
import com.gf.golboogi.vo.NoticeProfileListVO;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<NoticeProfileListVO> list(String keyword, int page, int size) {
		Map<String, Object> param = new HashMap<>();
		param.put("keyword", keyword);
		
		int end = page * size;
		int begin = end - (size - 1);
		param.put("begin", begin);
		param.put("end", end);
		
		return sqlSession.selectList("notice.list", param);
	}
	

	@Override
	public int count(String keyword) {
		return sqlSession.selectOne("notice.count", keyword);
	}

	
	
	@Override
	public void write(NoticeDto noticeDto) {
		int noticeNo = sqlSession.selectOne("notice.sequence");
		noticeDto.setNoticeNo(noticeNo);
		sqlSession.insert("notice.write",noticeDto);
	}

	@Override
	public NoticeDto read(int noticeNo) {
		sqlSession.update("notice.plusReadcount", noticeNo);
		return sqlSession.selectOne("notice.one", noticeNo);
	}

	@Override
	public NoticeDto info(int noticeNo) {
		return sqlSession.selectOne("notice.one", noticeNo);
	}

	@Override
	public boolean edit(NoticeDto noticeDto) {
		return sqlSession.update("notice.edit", noticeDto) > 0;
	}
	
	@Override
	public boolean delete(int noticeNo) {
		int count = sqlSession.delete("notice.delete", noticeNo);
		return count > 0;
	}

}
