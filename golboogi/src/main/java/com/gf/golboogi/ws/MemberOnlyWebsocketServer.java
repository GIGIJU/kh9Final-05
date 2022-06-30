package com.gf.golboogi.ws;

import java.util.Date;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gf.golboogi.vo.MessageVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MemberOnlyWebsocketServer extends TextWebSocketHandler {
	
	//사용자 저장소
	private Set<WebSocketSession> users = new CopyOnWriteArraySet<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("접속");
		Map<String, Object> map = session.getAttributes();
		log.debug("http session = {}", map);
		log.debug("아이디 = {}, 권한 = {}", map.get("login"), map.get("auth"));
		
		//여러 가지 방법이 있다
		//(1) 회원만 저장소에 추가 (login, auth가 있는 경우만 추가)
		//(2) 모두 저장소에 추가하고 회원만 메세지 전송이 가능하도록 처리(전체 추가 후 메세지에서 필터링)
		users.add(session);
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.debug("종료");
		users.remove(session);
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.debug("수신");

		//회원일지 비회원일지 모르기 때문에 구분해야 한다.
		Map<String, Object> map = session.getAttributes();
		String memberId = (String) map.get("login");
		String auth = (String) map.get("auth");

		//비회원 차단
		if(memberId == null || auth == null) return;
		
		//메세지 생성
		MessageVO vo = MessageVO.builder()
														.memberId(memberId)
														.memberAuth(auth)
														.text(message.getPayload())
														.time(new Date())
													.build();
		//메세지 JSON 변환
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		TextMessage newMessage = new TextMessage(json);
		
		//전체 전송
		for(WebSocketSession user : users) {
			//user.sendMessage(message);//사용자가 보낸 메세지
			user.sendMessage(newMessage);//새로 만든 메세지(+아이디,권한,시간)
		}
	}
}