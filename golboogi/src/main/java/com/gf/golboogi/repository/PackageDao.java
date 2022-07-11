package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.PackageDto;
import com.gf.golboogi.vo.PackageVO;


public interface PackageDao {
//	List<PackageDto> list(); 
//	PackageDto one(int packageNo);
	
	PackageDto insert(PackageDto packageDto); 
	
	List<PackageVO> list();
	PackageVO one(int packageNo);
	
	
}
