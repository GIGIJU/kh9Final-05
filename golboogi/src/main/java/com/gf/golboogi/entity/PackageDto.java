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
		private int fieldNo;
		private int packageBreakfast;
		
	}

