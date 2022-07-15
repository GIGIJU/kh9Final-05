package com.gf.golboogi.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.gf.golboogi.vo.KakaoPayApproveRequestVO;
import com.gf.golboogi.vo.KakaoPayApproveResponseVO;
import com.gf.golboogi.vo.KakaoPayCancelRequestVO;
import com.gf.golboogi.vo.KakaoPayCancelResponseVO;
import com.gf.golboogi.vo.KakaoPayOrderRequestVO;
import com.gf.golboogi.vo.KakaoPayOrderResponseVO;
import com.gf.golboogi.vo.KakaoPayReadyRequestVO;
import com.gf.golboogi.vo.KakaoPayReadyResponseVO;

import lombok.extern.slf4j.Slf4j;

@PropertySource("application.properties")
@Slf4j
@Service
public class KakaoPayServiceVersion1  implements KakaoPayService{
	
    @Value("${kakao.authorization}")
    String authorization;
    @Value("${kakao.urlPrefix}")
    String urlPrefix;
    @Value("${kakao.contentType}")
    String contentType;
    @Value("${kakao.cid}")
    String cid;
	
	private RestTemplate template = new RestTemplate();
	
	@Override
	public KakaoPayReadyResponseVO ready(KakaoPayReadyRequestVO requestVO) throws URISyntaxException {
		//header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", authorization);
		headers.add("Content-type", contentType);
		
		//body
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", cid);
		body.add("partner_order_id", requestVO.getPartner_order_id());
		body.add("partner_user_id", requestVO.getPartner_user_id());
		body.add("item_name", requestVO.getItem_name());
		body.add("quantity", String.valueOf(requestVO.getQuantity()));
		body.add("total_amount", String.valueOf(requestVO.getTotal_amount()));
		body.add("tax_free_amount", "0");//무조건 0원

		String prefix = ServletUriComponentsBuilder
													.fromCurrentContextPath()
													.path("/pay")
													.toUriString();
		//String prefix = "http://localhost:8080/golboogi/pay";
		body.add("approval_url", prefix+"/approve");
		body.add("cancel_url", prefix+"/cancel");
		body.add("fail_url", prefix+"/fail");
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		URI uri = new URI(urlPrefix + "/ready");
		
		KakaoPayReadyResponseVO responseVO = 
				template.postForObject(uri, entity, KakaoPayReadyResponseVO.class);
		
		//테스트용 로그
//		log.debug("tid = {}", responseVO.getTid());
//		log.debug("partner_order_id = {}", requestVO.getPartner_order_id());
//		log.debug("partner_user_id = {}", requestVO.getPartner_user_id());
		
		return responseVO;
	}
	
	@Override
	public KakaoPayApproveResponseVO approve(KakaoPayApproveRequestVO requestVO) throws URISyntaxException {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", authorization);
		headers.add("Content-type", contentType);
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", cid);
		body.add("tid", requestVO.getTid());//결제요청시의 거래번호
		body.add("partner_order_id", requestVO.getPartner_order_id());//결제요청시의 거래번호
		body.add("partner_user_id", requestVO.getPartner_user_id());//결제요청시의 회원번호
		body.add("pg_token", requestVO.getPg_token());//결제 성공 후 서버에서 반환되는 토큰(Token)
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		URI uri = new URI(urlPrefix + "/approve");
		
		KakaoPayApproveResponseVO responseVO = 
				template.postForObject(uri, entity, KakaoPayApproveResponseVO.class);
		return responseVO;
	}

	@Override
	public KakaoPayOrderResponseVO order(KakaoPayOrderRequestVO requestVO) throws URISyntaxException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public KakaoPayCancelResponseVO cancel(KakaoPayCancelRequestVO requestVO) throws URISyntaxException {
		// TODO Auto-generated method stub
		return null;
	}


}
