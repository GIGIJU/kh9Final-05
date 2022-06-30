package com.gf.golboogi;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.vo.BookingComplexSearchVO;
import com.gf.golboogi.vo.BookingSearchListVO;

import lombok.extern.slf4j.Slf4j;

//Spring boot에서는 @SpringBootTest만 붙이면 모든 환경이 연동된다.
@Slf4j
@SpringBootTest
@MapperScan(basePackages = "com.gf.golboogi")
class GolboogiApplicationTests {
	
	@Autowired
	private SqlSession sqlSession;

//	@Test
//	void contextLoads() {
//		BookingComplexSearchVO searchVO = BookingComplexSearchVO.builder()
//								.partTime(1)
//								.teeTimeD("2022-06-30")
//								.build();
//		List<BookingSearchListVO> list = sqlSession.selectList("golfField.search",searchVO);
//		for(BookingSearchListVO listVO : list) {
//			System.out.println(listVO);
//			log.debug("list={}",listVO.getTeeTimeNo());
//		}
//	}
	
	@Test
	void contextLoads() {
		GolfFieldDto fieldDto = sqlSession.selectOne("golfFeild.one",1);
		log.debug("fieldDto= {}",fieldDto);
	}


}
