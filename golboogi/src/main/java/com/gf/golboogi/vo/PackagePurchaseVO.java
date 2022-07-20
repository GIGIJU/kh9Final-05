package com.gf.golboogi.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PackagePurchaseVO {
	private String memberId;
	private String packageNo;
	private int fieldNo;
	private int stayNo;
	private String fieldName;
	private String stayName;
	private Date packageDepart;
	private int quantity = 1;
}
