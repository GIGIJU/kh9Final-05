package com.gf.golboogi;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestPropertySource;

import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.repository.StayDao;
import com.gf.golboogi.service.StayService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
@ActiveProfiles("local")
@TestPropertySource(locations = "classpath:./application-local.properties")
public class StayTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private StayService stayService;
	
	@Autowired
	private StayDao stayDao;
	
//	@Test
	public void test() {
		StayDto stayDto  = StayDto.builder()
								.stayName("테스트숙소")
								.stayType("호텔")
								.stayPhone("032-123-4567")
								.stayRoom("4인1실")
								.stayPostAddress("12345")
								.stayBasicAddress("기본주소")
								.stayDetailAddress("상세주소")
								.stayLocal("제주도")
							.build();
		stayDao.insert(stayDto);
	}
	
}
