package com.gf.golboogi.vo;



import java.util.List;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.PackageDto;
import com.gf.golboogi.entity.StayDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class PackageVO {
	private int packageNo;
	private StayDto stayDto;
	private GolfFieldDto fieldDto;
	private PackageDto packageDto;
		
	List<PackageVO> packagelist;

	
}
