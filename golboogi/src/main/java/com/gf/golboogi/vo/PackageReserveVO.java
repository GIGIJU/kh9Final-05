package com.gf.golboogi.vo;

import java.sql.Date;
import java.util.List;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.PackageDto;
import com.gf.golboogi.entity.PackageReserveDto;
import com.gf.golboogi.entity.StayDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder

public class PackageReserveVO {
	private String fieldNo;
	private int packageTotalPrice;
	private int packageBookingNo;
	private String memberId;
	private Date packageDepart;
	private Date packageReserveTime;
	private String packageStatus;
	private int packageNo;
	private String stayName;
	private String fieldName;
	
	
}
