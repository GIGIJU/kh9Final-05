package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public BookingDto checkBooking(int teeTimeNo, String teeTimeD) {
		Map<String, Object> param = new HashMap<>();
		param.put("teeTimeNo", teeTimeNo);
		param.put("teeTimeD", teeTimeD);

		BookingDto bookingDto = sqlSession.selectOne("booking.check",param);
		return bookingDto;
	}

	// 회원 예약 정보 가져오기
	@Override
	public List<BookingDto> info(String memberId) {
		return sqlSession.selectList("booking.reservation",memberId);
	}
	
	
	
	
}
