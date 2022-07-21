package com.gf.golboogi.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gf.golboogi.vo.ChartMemberVO;
import com.gf.golboogi.vo.ChartSalesVO;
import com.gf.golboogi.vo.ChartVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ChartMemberVO> getMemberJoinList() {
		List<ChartMemberVO> inventory = new ArrayList<>();
		for(int i = 1; i <= 12; i++) {
			ChartMemberVO tmp = sqlSession.selectOne("chart.memberOne", i);
			inventory.add(tmp);
		}
		return inventory;
	}


	@Override
	public ChartVO chartVO() {
//		List<ChartMemberVO> memberVO = sqlSession.selectList("chart.memberList");
//		List<ChartSalesVO> salesVO = sqlSession.selectList("chart.salesList");
//		ChartVO chartVO = new ChartVO();
//		chartVO.setChartMemberVO(memberVO);
//		chartVO.setChartSalesVO(salesVO);
//		
		return null;//null아님 수정해야함
	}


}
