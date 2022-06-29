package com.gf.golboogi.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class StayDto {
	
		private int stayNo;
		private String stayName;
		private String stayType;
		private String stayPhone;
		private String stayRoom;
		private int stayPrice;
		private String stayPostAddress;
		private String stayBasicAddress;
		private String stayDetailAddress;
		private String stayStatus;
	}

