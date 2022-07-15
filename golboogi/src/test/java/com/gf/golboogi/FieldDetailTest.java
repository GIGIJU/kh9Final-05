package com.gf.golboogi;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.web.WebAppConfiguration;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.repository.FieldProfileDao;
import com.gf.golboogi.repository.GolfFieldDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
@WebAppConfiguration
public class FieldDetailTest {
	
	@Autowired SqlSession sqlSession;
	@Autowired private GolfFieldDao golfFieldDao;
	@Autowired private FieldProfileDao fieldProfileDao;
	
	@Test
	public void test() {
		GolfFieldDto dto = GolfFieldDto.builder()
								.fieldNo(999)
								.fieldName("test999")
								.fieldInfo("test999")
								.fieldPhone("1234569876")
								.fieldPost("12345")
								.fieldBasicAddress("basicAddress")
								.fieldDetailAddress("detailAddress")
								.fieldCaddiefee(3000)
								.fieldCartfee(3000)
								.fieldGreenfee(3000)
								.fieldOpenday("2022-03-03")
								
							.build();
		System.out.println(dto);
//		GolfFieldDto info = golfFieldDao.selectOne(fieldNo);
//		
////		//프로필 이미지의 다운로드 주소를 추가
////		// - member_profile 에서 아이디를 이용하여 단일조회를 수행
////		// - http://localhost:8080/home/attachment/download?attachmentNo=OOO
//		List<Integer> list = fieldProfileDao.multiInfo(info.getFieldNo());
//		if(list.isEmpty()) {
//			model.addAttribute("profileUrl", "http://via.placeholder/873x500");
//		}
//		else {
//			for(Integer attachmentNo : list) {
//				log.debug("번호 : {}", attachmentNo);
//				model.addAttribute("profileUrl", "/attachment/download?attachmentNo=" + attachmentNo);
//			}
//		}
//		
//		return "field/field_detail";
		
	}
}
