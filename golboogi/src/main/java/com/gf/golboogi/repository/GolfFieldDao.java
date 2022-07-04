package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.GolfCourseDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.TeetimeDto;
import com.gf.golboogi.vo.BookingComplexSearchVO;
import com.gf.golboogi.vo.BookingSearchListVO;
import com.gf.golboogi.vo.GolfFieldBookingVO;
import com.gf.golboogi.vo.Teetime1VO;

public interface GolfFieldDao {
	List<GolfFieldDto> selectList();
	GolfFieldDto selectOne(int fieldNo);
	void teetimeInsert(int courseNo);
	List<TeetimeDto> selectTeetimeList(int fieldNo,String teeTimeD);
	Teetime1VO selectCourse(int teeTimeNo);
	List<BookingSearchListVO> searchList(BookingComplexSearchVO searchVO);
	List<GolfFieldBookingVO> teeTimeDayList();
	void addCommission(int fieldNo, int commission);
}
