package com.gf.golboogi;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.gf.golboogi.repository.ReviewDao;

@SpringBootTest
public class GolfRattingVOTest {

	
	@Autowired
	private ReviewDao reviewDao;
	
	@Test
	public void test() {
		String fieldName = "보성cc";
		float rating = reviewDao.ratingView(fieldName);
		System.out.println(rating);
		//log.debug("rating = {}", rating);
	}
}
