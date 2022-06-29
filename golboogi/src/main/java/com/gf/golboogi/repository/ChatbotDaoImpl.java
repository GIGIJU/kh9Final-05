package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.ChatbotDto;
import com.gf.golboogi.vo.ChatbotVO;

@Repository
public class ChatbotDaoImpl implements ChatbotDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ChatbotDto> getFirstMessages() {
		return sqlSession.selectList("chatbot.first");
	}

	@Override
	public List<ChatbotDto> getAnswer(int superNo) {
		return sqlSession.selectList("chatbot.answer", superNo);
	}
	
	@Override
	public List<ChatbotVO> getFirstMessages2() {
		return sqlSession.selectList("chatbot.first2");
	}

	@Override
	public List<ChatbotVO> getAnswer2(int superNo) {
		return sqlSession.selectList("chatbot.answer2", superNo);
	}
	
}