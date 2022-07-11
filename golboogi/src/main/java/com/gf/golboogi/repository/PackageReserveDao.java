package com.gf.golboogi.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.gf.golboogi.entity.PackageReserveDto;
import com.gf.golboogi.entity.StayDto;



public interface PackageReserveDao {
	void reserve(PackageReserveDto packageReserveDto);
	PackageReserveDto one(int packageBookingNo); //숙소번호 검색
}
