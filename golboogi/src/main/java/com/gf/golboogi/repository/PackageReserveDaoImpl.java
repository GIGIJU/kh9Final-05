package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.PackageReserveDto;
import com.gf.golboogi.vo.PackageReserveVO;
@Repository
public class PackageReserveDaoImpl implements PackageReserveDao{
	@Autowired
	private SqlSession sqlSession;
	
	private static Logger LOGGER = LoggerFactory.getLogger(PackageReserveDaoImpl.class);
	
	@Override
	public void reserve(PackageReserveDto packageReserveDto) {
		int packageBookingNo = sqlSession.selectOne("packageReserve.sequence");
		packageReserveDto.setPackageBookingNo(packageBookingNo);
		LOGGER.debug("LOGGER packageReserveDto : {}",  packageReserveDto);
		System.out.printf("SYSOUT packageReserveDto : %s\n", packageReserveDto);
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

	@Override
	public void cancel(int packageBookingNo) {
		sqlSession.update("packageReserve.cancel",packageBookingNo);
	}

	@Override
	public void payReserve(PackageReserveDto packageReserveDto) {
		int packageBookingNo = sqlSession.selectOne("packageReserve.sequence");
		packageReserveDto.setPackageBookingNo(packageBookingNo);
		sqlSession.insert("packageReserve.reservePay", packageReserveDto);

		
	}

	@Override
	public void payInsert(int packagebookingNo, int paymentNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("packagebookingNo", packagebookingNo);
		param.put("paymentNo", paymentNo);
		
		sqlSession.insert("booking.payInsert",param);
		
		
	}

	@Override
	public int reserveConfirm(PackageReserveDto packageReserveDto) {
		return sqlSession.selectOne("packageReserve.reserveConfirm", packageReserveDto);
	}

}
