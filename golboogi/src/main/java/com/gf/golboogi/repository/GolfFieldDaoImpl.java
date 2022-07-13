package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.TeetimeDto;
import com.gf.golboogi.vo.BookingComplexSearchVO;
import com.gf.golboogi.vo.BookingSearchListVO;
import com.gf.golboogi.vo.GolfFieldBookingVO;
import com.gf.golboogi.vo.TeeTimeListVO;
import com.gf.golboogi.vo.Teetime1VO;

@Repository
public class GolfFieldDaoImpl implements GolfFieldDao{

	
	@Autowired
	private SqlSession sqlSession;

	//골프장 전체 리스트 출력
	@Override
	public List<GolfFieldDto> selectList() {
		return sqlSession.selectList("golfField.list");
	}

	//골프장 상세 출력
	@Override
	public GolfFieldDto selectOne(int fieldNo) {
		return sqlSession.selectOne("golfField.one",fieldNo);
	}


	//한 골프장의 티타임 리스트 출력
	@Override
	public List<TeeTimeListVO> selectTeetimeList(int fieldNo,String teeTimeD) {
		Map<String , Object> param = new HashMap<>();
		param.put("teeTimeD", teeTimeD);
		param.put("fieldNo", fieldNo);
		
		return sqlSession.selectList("teetime.list2",param);
	}
	
	//한 골프장의 티타임 리스트 출력
	@Override
	public List<TeeTimeListVO> selectTeetimeList(BookingComplexSearchVO searchVO) {
		return sqlSession.selectList("teetime.list",searchVO);
	}

	//골프장 , 코스 정보 출력
	@Override
	public Teetime1VO selectCourse(int teeTimeNo) {
		return sqlSession.selectOne("teetime.one",teeTimeNo);
	}


	//티타임 저장 (관리자 페이지로 옮겨야함)
	@Override
	public void teetimeInsert(int courseNo) {
		
		TeetimeDto teetimeDto = new TeetimeDto();
		teetimeDto.setCourseNo(courseNo);
		
		String teeTime = "";
		for (int i=500; i<1900; i+=20) {
			if(i%100 !=60 &&  i%100 !=80) {
				int teeTimeNo = sqlSession.selectOne("teetime.sequence");
				teetimeDto.setTeeTimeNo(teeTimeNo);
				if(i/100 < 10) {
					if(i/100 < 7) teetimeDto.setPartTime(1);
					teeTime = "0"+i/100+":"+i%100;
					if(i%100 == 0) teeTime = "0"+i/100+":"+i%100+"0";
					teetimeDto.setTeeTimeT(teeTime);
				}
				else {
					if(i/100 > 11 && i/100 <16) teetimeDto.setPartTime(3);
					if(i/100 > 15 && i/100 <19) teetimeDto.setPartTime(4);
					teeTime = i/100+":"+i%100;
					if(i%100 == 0) teeTime = i/100+":"+i%100+"0";
					teetimeDto.setTeeTimeT(teeTime);
				}
				if(i/100 > 6 && i/100 <12) teetimeDto.setPartTime(2);
				sqlSession.insert("teetime.insert",teetimeDto);
			}
		}
	}

	//검색
	@Override
	public List<BookingSearchListVO> searchList(BookingComplexSearchVO searchVO) {
		List<BookingSearchListVO> list = sqlSession.selectList("golfField.search",searchVO);
		if(list.isEmpty()) {
			return null;			
		}
		else {
			return list;
		}
	}

	//날짜별 예약가능 골프장 목록 (계층형)
//	@Override
	public List<GolfFieldBookingVO> teeTimeDayList() {
		return sqlSession.selectList("teetime.treeSearch");
	}
	
	//날짜별 예약가능 골프장 목록 (계층형X)
//	@Override
//	public List<BookingSearchListVO> teeTimeDayList(String teeTimeD) {
//		return sqlSession.selectList("golfField.search", teeTimeD);
//	}

	//예약 시 수수료 추가
	@Override
	public void addCommission(int fieldNo, int commission) {
		Map<String, Object> param = new HashMap<>();
		param.put("commission", commission);
		param.put("fieldNo", fieldNo);
		
		sqlSession.update("golfField.commissionUpdate",param);	
	}

	//골프장 인기순 출력
	@Override
	public List<BookingSearchListVO> selectRank() {
		return sqlSession.selectList("golfField.ranking");
	}
	//선결제 골프장 출력
	@Override
	public List<GolfFieldDto> selectPrepay() {
		return sqlSession.selectList("golfField.prepay");
	}
	//비용 저렴한 골프장 출력
	@Override
	public List<GolfFieldDto> selectCheap() {
		return sqlSession.selectList("golfField.cheap");
	}
	
	@Override
	public List<GolfFieldDto> list(String type, String keyword, int page, int size) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		int end = page * size;
		int begin = end - (size - 1);
		param.put("begin", begin);
		param.put("end", end);
		
		return sqlSession.selectList("golfField.list", param);
	}

	@Override
	public int count(String type, String keyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectOne("golfField.count", param);
	}
	
	// 골프장 정보 입력 @이기주
	@Override
	public void insert(GolfFieldDto golfFieldDto) {
		int sequence = sqlSession.selectOne("golfField.sequence");
		golfFieldDto.setFieldNo(sequence);
		sqlSession.insert("golfField.insert", golfFieldDto);
	}
	
	// 골프장 이름으로 번호 검색 @이기주
//	@Override
//	public int searchNo(String fieldName) {
//		return sqlSession.selectOne("golfField.searchNo", fieldName);
//	}

	@Override
	public List<GolfFieldDto> searchSimple() {
		return sqlSession.selectList("golfField.searchSimple");
	}
	
	
	
}
