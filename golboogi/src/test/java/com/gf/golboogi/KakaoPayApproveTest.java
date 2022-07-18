package com.gf.golboogi;

import java.net.URISyntaxException;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.gf.golboogi.service.KakaoPayService;
import com.gf.golboogi.vo.KakaoPayApproveRequestVO;
import com.gf.golboogi.vo.KakaoPayApproveResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
@MapperScan(basePackages = "com.gf.golboogi")
public class KakaoPayApproveTest {
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
//	@Test
	public void test() throws URISyntaxException {
		KakaoPayApproveResponseVO responseVO = 
					kakaoPayService.approve(
							KakaoPayApproveRequestVO.builder()
									.partner_order_id("8a2404f9-bcbb-4e56-8732-4adf3ff37d75")
									.partner_user_id("testuser1")
									.tid("T2a6ccdf65200508278c")
									.pg_token("0f5fe257106790120a41")
								.build()
					);
		log.debug("responseVO = {}", responseVO);
	}
	
}