package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.GolfCourseDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.TeetimeDto;
import com.gf.golboogi.vo.BookingComplexSearchVO;
import com.gf.golboogi.vo.BookingSearchListVO;
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
	void addCommission(int fieldNo, int commission);
	List<BookingSearchListVO> selectRank();
	List<GolfFieldDto> selectPrepay();
	List<GolfFieldDto> selectCheap();
	List<GolfFieldDto> list(String type, String keyword, int page, int size);
	int count(String type, String keyword);
	List<BookingSearchListVO> listAll(String fieldArea, String type, int page, int size);
	int countAll();
	void minusCommission(String fieldName, int commission);
	
	
	// 골프장 정보 입력(=골프장 등록) @이기주 / 골프장 + 코스정보  >> 이게 최신입니다. 불필요한건 테스트 후에 지우겠습니다.
	void fieldInsert(GolfFieldDto golfFieldDto, int fieldNo);
	
	// 골프장 이름으로 검색 @이기주
	List<GolfFieldDto> searchSimple(); // 리스트 형태로 전체 출력
	int searchNoByName(String fieldName);
	
	// 골프장 이름으로 번호 검색 @이기주
	
	
}
