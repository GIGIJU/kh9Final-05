package com.gf.golboogi.vo;



import java.util.Date;
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
public class PackageVO {
	private int packageNo;
	private int stayNo;
	private int attachmentNo;
//	private int golfAttachmentNo;
	private StayDto stayDto;
	private GolfFieldDto fieldDto;
	private PackageDto packageDto;
	//private PackageReserveDto packageReserveDto;
		
	List<PackageVO> packagelist;

	
}
