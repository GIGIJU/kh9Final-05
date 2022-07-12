package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.BookingDto;

public interface BookingDao {
	void reservation(BookingDto bookingDto);
	BookingDto checkBooking(int teeTimeNo, String teeTimeD);
	//회원 예약 정보 불러오기
	List<BookingDto> info(String memberId);

}
