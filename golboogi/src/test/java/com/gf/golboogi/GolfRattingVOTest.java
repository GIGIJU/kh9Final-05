package com.gf.golboogi;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.gf.golboogi.repository.ReviewDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class GolfRattingVOTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Test
	public void test() {
		String fieldName = "보성cc";
		Double rating = reviewDao.ratingView(fieldName);
		log.info("rating = {}", rating);
	}
}