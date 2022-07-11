package com.gf.golboogi.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.PackageReserveDto;
@Repository
public class PackageReserveDaoImpl implements PackageReserveDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void reserve(PackageReserveDto packageReserveDto) {
		int sequence = sqlSession.selectOne("package_reserve.sequence");
		packageReserveDto.setPackageBookingNo(sequence);
		sqlSession.insert("package_reserve.insert", packageReserveDto);
		
	}

}
