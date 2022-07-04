package com.gf.golboogi.entity;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PackageDto {
	
		private int packageNo;
		private int stayNo;
		private Date packageDepart;
		private Date packageArrive;
		private int packageBreakfast;
	}

