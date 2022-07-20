package com.gf.golboogi.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PackageReserveDto {
	private int packageBookingNo;
	private int bookingNo;
	private int packageNo;
	private String memberId;
	private int packageTotalPrice;
	private String packageStatus;
	private Date packageReserveTime;
	private Date packageDepart;

}
