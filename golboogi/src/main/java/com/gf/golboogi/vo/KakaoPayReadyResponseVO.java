package com.gf.golboogi.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoPayReadyResponseVO {
	private String tid;
	private String next_redirect_mobile_url, next_redirect_pc_url;
	private Date created_at;
}


//구현중