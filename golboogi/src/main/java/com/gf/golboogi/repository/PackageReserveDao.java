package com.gf.golboogi.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.gf.golboogi.entity.PackageReserveDto;



public interface PackageReserveDao {
	void reserve(PackageReserveDto packageReserveDto);
}
