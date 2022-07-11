package com.gf.golboogi;

import java.net.URISyntaxException;
import java.util.UUID;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.gf.golboogi.service.KakaoPayService;
import com.gf.golboogi.vo.KakaoPayReadyRequestVO;
import com.gf.golboogi.vo.KakaoPayReadyResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
@MapperScan(basePackages = "com.gf.golboogi")
public class KakaoPayReadyTest {
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Test
	public void test() throws URISyntaxException {
		KakaoPayReadyResponseVO responseVO = 
						kakaoPayService.ready(
								KakaoPayReadyRequestVO.builder()
									.partner_order_id(UUID.randomUUID().toString())
									.partner_user_id("testuser1")
									.item_name("강남 아파트 1채 외 3건")
									.quantity(1)
									.total_amount(123000)
								.build()
						);
		log.debug("responseVO = {}", responseVO);
		log.debug(responseVO.getNext_redirect_pc_url());
	}
	
}



