package com.gf.golboogi.service;

import java.util.List;

import com.gf.golboogi.vo.ChartMemberVO;
import com.gf.golboogi.vo.ChartSalesVO;
import com.gf.golboogi.vo.ChartVO;

public interface ChartService {
	

	public List<ChartMemberVO> getMemberJoinList();

	public List<ChartSalesVO> getSalesList();


	
	
	
}
