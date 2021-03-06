package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.BookingDto;
import com.gf.golboogi.vo.BookingPurchaseVO;
import com.gf.golboogi.vo.MyBookingListVO;

@Repository
public class BookingDaoImpl implements BookingDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void reservation(BookingDto bookingDto) {
		int bookingSequence = sqlSession.selectOne("booking.sequence");
		bookingDto.setBookingNo(bookingSequence);
		
		//예약 취소 변경
		int teeTimeNo = bookingDto.getTeeTimeNo();
		sqlSession.update("booking.updateBookingPeople",teeTimeNo);
		//예약
		sqlSession.insert("booking.insert",bookingDto);
	}
	
	@Override
	public void payReservation(BookingPurchaseVO bookingPurchaseVO) {
		int bookingSequence = sqlSession.selectOne("booking.sequence");
		bookingPurchaseVO.setBookingNo(bookingSequence);
		
		//예약 취소 변경
		int teeTimeNo = bookingPurchaseVO.getTeeTimeNo();
		sqlSession.update("booking.updateBookingPeople",teeTimeNo);
		//예약
		sqlSession.insert("booking.payInsert",bookingPurchaseVO);
		
		System.out.println("예약완룡");
	}

	@Override
	public BookingDto checkBooking(int teeTimeNo, String teeTimeD) {
		Map<String, Object> param = new HashMap<>();
		param.put("teeTimeNo", teeTimeNo);
		param.put("teeTimeD", teeTimeD);
		
		BookingDto bookingDto = sqlSession.selectOne("booking.check",param);
		return bookingDto;
	}

	@Override
	public List<MyBookingListVO> myBookingList(String memberId) {
		return sqlSession.selectList("booking.myBookingList",memberId);
	}

	@Override
	public void cancel(int bookingNo) {
		int count = sqlSession.update("booking.cancel",bookingNo);
		if(count<1) {
			//에러페이지
		}
	}

	// 회원 예약 정보 가져오기
	@Override
	public List<BookingDto> info(String memberId) {
		return sqlSession.selectList("booking.reservation",memberId);
	}

	//예약 단일 조회
	@Override
	public BookingDto info(int bookingNo) {
		return sqlSession.selectOne("booking.info",bookingNo);
	}

	//예약 상세 정보
	@Override
	public MyBookingListVO myBookingInfo(int bookingNo) {
		return sqlSession.selectOne("booking.myBookingInfo",bookingNo);
	}

	@Override
	public void paymentInsert(int bookingNo, int paymentNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("bookingNo", bookingNo);
		param.put("paymentNo", paymentNo);
		
		sqlSession.insert("booking.paymentInsert",param);
	}
	
}
