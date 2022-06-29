package com.gf.golboogi.ws;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.gf.golboogi.ws.DefaultWebsocketServer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class DefaultWebsocketServer extends TextWebSocketHandler{
  
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("접속 완료! {}", session);
		log.debug("session = {}", session);
	}
		
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.debug("접속 종료! {}");
		log.debug("session = {}", session);
		log.debug("status = {}", status);
	}
	}