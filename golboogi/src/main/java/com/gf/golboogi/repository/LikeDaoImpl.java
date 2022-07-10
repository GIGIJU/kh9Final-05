package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.LikeDto;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Repository
public class LikeDaoImpl implements LikeDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public LikeDto insert(LikeDto likeDto) {
		int likeNo = sqlSession.selectOne("like.sequence");
		likeDto.setLikeNo(likeNo);
		log.info("likeDto = {}",likeDto);
		sqlSession.insert("like.insert", likeDto);
		return sqlSession.selectOne("like.one", likeNo);
	}

	@Override
	public List<LikeDto> list(int likeTinfo) {
		return sqlSession.selectList("like.list",likeTinfo);
	}
	
	
}
