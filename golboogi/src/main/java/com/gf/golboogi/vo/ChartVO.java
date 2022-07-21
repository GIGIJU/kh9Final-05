package com.gf.golboogi.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ChartVO {
	private List<ChartMemberVO> chartMemberVO;
	private List<ChartSalesVO> chartSalesVO;
}
