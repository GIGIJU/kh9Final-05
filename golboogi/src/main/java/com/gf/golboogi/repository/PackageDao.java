package com.gf.golboogi.repository;

import java.util.Date;
import java.util.List;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.PackageDto;
import com.gf.golboogi.vo.PackageVO;


public interface PackageDao {
//	List<PackageDto> list(); 
//	PackageDto one(int packageNo);
	
	PackageDto insert(PackageDto packageDto); 
	
	List<PackageVO> list();
	PackageVO one(int packageNo);
	List<PackageVO> list(String stayPrice, String stayLocal, String packageDepart);
	
	
}
