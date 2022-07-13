package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.GolfCourseDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.TeetimeDto;
import com.gf.golboogi.vo.BookingComplexSearchVO;
import com.gf.golboogi.vo.BookingSearchListVO;
import com.gf.golboogi.vo.GolfFieldBookingVO;
import com.gf.golboogi.vo.TeeTimeListVO;
import com.gf.golboogi.vo.Teetime1VO;

public interface GolfFieldDao {
	List<GolfFieldDto> selectList();
	GolfFieldDto selectOne(int fieldNo);
	void teetimeInsert(int courseNo);
	List<TeeTimeListVO> selectTeetimeList(int fieldNo,String teeTimeD);
	List<TeeTimeListVO> selectTeetimeList(BookingComplexSearchVO searchVO);
	Teetime1VO selectCourse(int teeTimeNo);
	List<BookingSearchListVO> searchList(BookingComplexSearchVO searchVO);
	List<GolfFieldBookingVO> teeTimeDayList();
	void addCommission(int fieldNo, int commission);
	List<BookingSearchListVO> selectRank();
	List<GolfFieldDto> selectPrepay();
	List<GolfFieldDto> selectCheap();
	List<GolfFieldDto> list(String type, String keyword, int page, int size);
	int count(String type, String keyword);
	
	// 골프장 정보 입력 페이지(=골프장 등록) @이기주
	void insert(GolfFieldDto golfFieldDto);
	
	// 골프장 이름으로 검색 @이기주
	List<GolfFieldDto> searchSimple();
	
}
