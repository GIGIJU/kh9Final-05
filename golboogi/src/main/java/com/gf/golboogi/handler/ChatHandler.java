package com.gf.golboogi.handler;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j2;

@Component
@Log4j2
public class ChatHandler extends TextWebSocketHandler {

	   // message
	   @Override
	   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	   //websocket을 통해서 받은 메세지를 처리하는 메소드
	   }

	   // connection established
	   @Override
	   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	   //websocket에 session이 접속했을 때, 처리하는 메소드
	   }

	   // connection closed
	   @Override
	   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	   //websocket에 session이 접속을 해제 했을 때, 처리하는 메소드
	   }

	}