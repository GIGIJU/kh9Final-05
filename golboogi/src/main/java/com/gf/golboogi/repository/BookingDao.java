package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.BookingDto;
import com.gf.golboogi.vo.BookingPurchaseVO;
import com.gf.golboogi.vo.MyBookingListVO;

public interface BookingDao {
	void reservation(BookingDto bookingDto);
	BookingDto checkBooking(int teeTimeNo, String teeTimeD);
	List<MyBookingListVO> myBookingList(String memberId);
	void cancel(int bookingNo);
	BookingDto info(int bookingNo);

	//회원 예약 정보 불러오기
	List<BookingDto> info(String memberId);
	//예약 현황 상세 정보
	MyBookingListVO myBookingInfo(int bookingNo);
	
	void payReservation(BookingPurchaseVO bookingPurchaseVO);
	void paymentInsert(int bookingNo, int paymentNo);
}
