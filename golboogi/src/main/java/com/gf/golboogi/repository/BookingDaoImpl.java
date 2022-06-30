package com.gf.golboogi.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.BookingDto;

@Repository
public class BookingDaoImpl implements BookingDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void reservation(BookingDto bookingDto) {
		int bookingSequence = sqlSession.selectOne("booking.sequence");
		bookingDto.setBookingNo(bookingSequence);
		
		sqlSession.insert("booking.insert",bookingDto);
	}
	
	
	
}
