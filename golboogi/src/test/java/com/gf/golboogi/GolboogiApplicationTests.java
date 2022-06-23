package com.gf.golboogi;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.gf.golboogi.entity.ProductDto;

import lombok.extern.slf4j.Slf4j;

//Spring boot에서는 @SpringBootTest만 붙이면 모든 환경이 연동된다.
@Slf4j
@SpringBootTest
class GolboogiApplicationTests {
	
	@Autowired
	private SqlSession sqlSession;

	@Test
	void contextLoads() {
		List<ProductDto> list = sqlSession.selectList("product.list");
		for(ProductDto productDto : list) {
			log.info("productDto = {}", productDto);
		}
	}


}
