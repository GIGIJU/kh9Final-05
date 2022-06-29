package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.ChatbotDto;
import com.gf.golboogi.vo.ChatbotVO;

public interface ChatbotDao {
	List<ChatbotDto> getFirstMessages();
	List<ChatbotDto> getAnswer(int superNo);
	List<ChatbotVO> getFirstMessages2();
	List<ChatbotVO> getAnswer2(int superNo);
	
}
