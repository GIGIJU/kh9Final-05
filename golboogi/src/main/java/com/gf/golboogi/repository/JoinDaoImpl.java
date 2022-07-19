package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.JoinApplyDto;
import com.gf.golboogi.entity.JoinDto;
import com.gf.golboogi.vo.JoinApplyListVO;
import com.gf.golboogi.vo.JoinListVO;
import com.gf.golboogi.vo.MyJoinApplyListVO;
import com.gf.golboogi.vo.MyJoinListVO;

@Repository
public class JoinDaoImpl implements JoinDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<JoinListVO> selectList(String type, String keyword,int page,int size) {
		Map<String, Object> param = new HashMap<>();
		
		param.put("type", type);
		param.put("keyword", keyword);
		
		int end = page * size;
		int begin = end - (size - 1);
		param.put("begin", begin);
		param.put("end", end);
		
		return sqlSession.selectList("join.list",param);
	}

	//조인 신청
	@Override
	public void joinApply(JoinApplyDto joinApplyDto) {
		int joinApplyNo = sqlSession.selectOne("join.applySequence");
		joinApplyDto.setJoinApplyNo(joinApplyNo);
		
		sqlSession.insert("join.applyInsert",joinApplyDto);
		
	}

	//조인신청 번호로 조인 번호 가져오기
	@Override
	public int getjoinNo(int joinApplyNo) {
		return sqlSession.selectOne("join.getJoinNo",joinApplyNo);
	}
	
	//조인 승인 시 인원 추가
	@Override
	public int addjoinPeople(int joinApplyPeople, int joinNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("joinApplyPeople", joinApplyPeople);
		param.put("joinNo", joinNo);
		
		int count = sqlSession.update("join.addJoinPeople",param);
		if(count<1) {
			System.err.println("에러페이지");
		}
		return count;
	}

	//페이지네이션을 위한 count
	@Override
	public int count(String type, String keyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectOne("join.count", param);
	}

	//조인 등록
	@Override
	public void insert(JoinDto joinDto) {
		int joinNo = sqlSession.selectOne("join.sequence");
		joinDto.setJoinNo(joinNo);
		
		sqlSession.insert("join.insert",joinDto);
	}

	//나의 조인 등록 list
	@Override
	public List<MyJoinListVO> myJoinList(String memberId) {
		return sqlSession.selectList("join.myJoinTreeSearch",memberId);
	}

	//조인 신청 승인
	@Override
	public void joinApplyApprove(int joinApplyNo) {
		sqlSession.update("join.joinApplyApprove",joinApplyNo);
		
		int joinNo = sqlSession.selectOne("join.getJoinNo",joinApplyNo);
		int joinPeople = sqlSession.selectOne("join.getJoinPeople",joinNo);
		if(joinPeople==0) {
			sqlSession.update("join.closeJoin",joinNo);
			sqlSession.update("join.applyUpdate",joinNo);
		}
	}

	//조인 신청 거절
	@Override
	public void joinApplyRefuse(int joinApplyNo) {
		sqlSession.update("join.joinApplyRefuse",joinApplyNo);		
	}

	//나의 조인 신청 리스트
	@Override
	public List<MyJoinApplyListVO> myJoinApplyList(String memberId) {
		return sqlSession.selectList("join.myJoinApplyList",memberId);
	}

	//조인 등록 삭제
	@Override
	public void joinDelete(int joinNo) {
		sqlSession.delete("join.joinDelete",joinNo);
	}

	//조인 신청 취소
	@Override
	public void joinApplyCancel(int joinApplyNo) {
		sqlSession.delete("join.joinApplyCancel",joinApplyNo);
	}

	//조인 단일 조회
	@Override
	public JoinDto selectOne(int joinNo) {
		return sqlSession.selectOne("join.selectOne",joinNo);
	}

	//조인 수정
	@Override
	public void joinEdit(JoinDto joinDto) {
		sqlSession.update("join.joinEdit",joinDto);
	}

	
	

}
