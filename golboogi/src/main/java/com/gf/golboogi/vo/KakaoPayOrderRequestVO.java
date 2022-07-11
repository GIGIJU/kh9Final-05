package com.gf.golboogi.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoPayOrderRequestVO {
	private String tid;//거래번호
	private String cid;//가맹점번호
}
