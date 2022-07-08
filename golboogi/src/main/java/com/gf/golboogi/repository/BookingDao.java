package com.gf.golboogi.repository;

import com.gf.golboogi.entity.BookingDto;

public interface BookingDao {
	void reservation(BookingDto bookingDto);
	BookingDto checkBooking(int teeTimeNo, String teeTimeD);

}
