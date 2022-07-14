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
		int sequence = sqlSession.selectOne("packageReserve.sequence");
		packageReserveDto.setPackageBookingNo(sequence);
		sqlSession.insert("packageReserve.insert", packageReserveDto);
	}

	@Override
	public PackageReserveDto one(int packageBookingNo) {
		return sqlSession.selectOne("packageReserve.one", packageBookingNo);
	}

}
