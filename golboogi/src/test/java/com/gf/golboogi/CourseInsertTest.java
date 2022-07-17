package com.gf.golboogi;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.gf.golboogi.entity.GolfCourseDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.repository.FieldProfileDao;
import com.gf.golboogi.repository.GolfCourseDao;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.service.GolfFieldService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class CourseInsertTest {
	@Autowired SqlSession sqlSession;
	@Autowired private GolfFieldService golfFieldService;
	@Test
	public void test() throws IllegalStateException, IOException {
		GolfFieldDto golfFieldDto = GolfFieldDto.builder()
										.fieldName("KH골프장123")
										.fieldInfo("KH골프장123")
										.fieldPhone("021234567")
										.fieldPost("12345")
										.fieldBasicAddress("기본주소")
										.fieldDetailAddress("상세주소")
										.fieldCaddiefee(30000)
										.fieldCartfee(30000)
										.fieldGreenfee(30000)
										.fieldArea("경기도")
										.fieldOpenday("2002-02-02")
									.build();
		GolfCourseDto golfCourseDto = GolfCourseDto.builder()
											.courseName("골북이코스")
											.courseHole("18홀")
										.build();
		
		golfFieldService.insert(golfFieldDto, golfCourseDto, null);
		
		
		
		
		
	}
	
	
}
