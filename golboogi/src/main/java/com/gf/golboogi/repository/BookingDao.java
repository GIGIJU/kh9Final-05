package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.BookingDto;
import com.gf.golboogi.vo.MyBookingListVO;

public interface BookingDao {
	void reservation(BookingDto bookingDto);
	BookingDto checkBooking(int teeTimeNo, String teeTimeD);
	List<MyBookingListVO> myBookingList(String memberId);
	void cancel(int bookingNo);

}
