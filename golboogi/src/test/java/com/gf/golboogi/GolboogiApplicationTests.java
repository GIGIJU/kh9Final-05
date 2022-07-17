package com.gf.golboogi;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.gf.golboogi.vo.BookingComplexSearchVO;
import com.gf.golboogi.vo.BookingSearchListVO;

//Spring boot에서는 @SpringBootTest만 붙이면 모든 환경이 연동된다.
@SpringBootTest
@MapperScan(basePackages = "com.gf.golboogi")
class GolboogiApplicationTests {
	
	@Autowired
	private SqlSession sqlSession;

//	@Test
	void contextLoads() {
		BookingComplexSearchVO searchVO = BookingComplexSearchVO.builder()
								//.partTime(2)
								.teeTimeD("2022-07-01")
								.fieldGreenfee(100000)
								//.fieldArea("경기")
								.build();
		List<BookingSearchListVO> list = sqlSession.selectList("golfField.search",searchVO);
		for(BookingSearchListVO listVO : list) {
			System.out.println(listVO);
			//log.debug("listVO={}",listVO);
		}
	}
	
//	@Test
//	void contextLoads() {
//		GolfFieldDto fieldDto = sqlSession.selectOne("golfFeild.one",1);
//		log.debug("fieldDto= {}",fieldDto);
//	}


}
