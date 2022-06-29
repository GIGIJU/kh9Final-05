package com.gf.golboogi.ws;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gf.golboogi.entity.ChatbotDto;
import com.gf.golboogi.repository.ChatbotDao;
import com.gf.golboogi.vo.ChatbotVO;

/**
	다중 사용자 고려할 필요없이 각각의 사용자와 1:1로 대화하도록 구현(echo)
	- 최초 접속 시에 사용자에게 첫 질문을 보내야 함(afterConnectionEstablished)
	- 이에 따른 응답이 올 경우 그에 대한 대답을 보내야 함(handleTextMessage)
 */
public class ChatbotWebsocketServer extends TextWebSocketHandler {
	
	@Autowired
	private ChatbotDao chatbotDao;
	
	private ObjectMapper mapper = new ObjectMapper();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//첫질문 발송
		//List<ChatbotDto> list = chatbotDao.getFirstMessages();
		List<ChatbotVO> list = chatbotDao.getFirstMessages2();
		//list를 JSON으로 변환하여 보내면 프론트엔드 처리 옵션이 다양해진다
		String json = mapper.writeValueAsString(list);
		session.sendMessage(new TextMessage(json));
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//사용자가 보낸 메세지의 답변을 찾아서 발송
		int chatbotNo = Integer.parseInt(message.getPayload());//번호를 int로 변환한다
		if(chatbotNo == 0) {//첫화면 리스트
			List<ChatbotVO> list = chatbotDao.getFirstMessages2();
			//list를 JSON으로 변환하여 보내면 프론트엔드 처리 옵션이 다양해진다
			String json = mapper.writeValueAsString(list);
			session.sendMessage(new TextMessage(json));
		}
		else {//답변리스트
			//List<ChatbotDto> list = chatbotDao.getAnswer(chatbotNo);//번호에 해당하는 답변을 조회한다
			List<ChatbotVO> list = chatbotDao.getAnswer2(chatbotNo);
			//list를 JSON으로 변환하여 보내면 프론트엔드 처리 옵션이 다양해진다
			String json = mapper.writeValueAsString(list);
			session.sendMessage(new TextMessage(json));
		}
	}
}