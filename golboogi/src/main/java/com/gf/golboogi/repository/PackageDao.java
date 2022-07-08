package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.PackageDto;


public interface PackageDao {
	List<PackageDto> list(); 
	PackageDto insert(PackageDto packageDto); 
	PackageDto one(int packageNo);
}
