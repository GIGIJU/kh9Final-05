package com.gf.golboogi.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MyJoinApplyListVO {
	 private int joinNo;
	 private int joinApplyNo;
	 private Date teeTimeD;
	 private String teeTimeT;
	 private String fieldName;
	 private String courseName;
	 private String joinWriter;
	 private String joinInfo;
	 private Date joinTime;
	 private int joinStatus;
	 private String memberNick;
	 private String joinWriterPhone;
	 private int bookingPrice;
	 private int joinApplyPeople;
	 private String joinApplyInfo;
	 private int joinApplyStatus;
	 private String joinApplyWriter;
	 private String joinApplyWriterPhone;
}
