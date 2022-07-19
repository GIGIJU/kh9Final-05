package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.PackageReserveDto;
import com.gf.golboogi.vo.PackageReserveVO;
@Repository
public class PackageReserveDaoImpl implements PackageReserveDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void reserve(PackageReserveDto packageReserveDto) {
		int packageBookingNo = sqlSession.selectOne("packageReserve.sequence");
		packageReserveDto.setPackageBookingNo(packageBookingNo);
		sqlSession.insert("packageReserve.reserve", packageReserveDto);
	}

	@Override
	public PackageReserveDto one(int packageBookingNo) {
		return sqlSession.selectOne("packageReserve.one", packageBookingNo);
	}

	@Override
	public void reserve2(PackageReserveDto packageReserveDto) {
		int packageBookingNo = sqlSession.selectOne("packageReserve.sequence");
		packageReserveDto.setPackageBookingNo(packageBookingNo);
		sqlSession.insert("packageReserve.reservePay", packageReserveDto);
		
	}

	@Override
	public List<PackageReserveVO> reserveList(String memberId) {
		return sqlSession.selectList("packageReserve.reserveList",memberId);
	}

}
