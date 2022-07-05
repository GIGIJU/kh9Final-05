package com.gf.golboogi.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReserveVO {
	private int stayNo;
	private int quantity =1;
}
