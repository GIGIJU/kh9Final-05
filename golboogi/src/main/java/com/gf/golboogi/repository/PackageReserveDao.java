package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.gf.golboogi.entity.PackageReserveDto;
import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.vo.BookingPurchaseVO;
import com.gf.golboogi.vo.MyBookingListVO;
import com.gf.golboogi.vo.PackageReserveVO;

public interface PackageReserveDao {
	void reserve(PackageReserveDto packageReserveDto);

	void reserve2(PackageReserveDto packageReserveDto);

	PackageReserveDto one(int packageBookingNo); // 숙소번호 검색

	List<PackageReserveVO> reserveList(String memberId);

	void cancel(int packageBookingNo);

	void payReserve(PackageReserveDto packageReserveDto);

	void payInsert(int packagebookingNo, int paymentNo);

	int reserveConfirm(PackageReserveDto packageReserveDto);
	
	int possible(int packagebookingNo);

	void paymentInsert(int packageBookingNo, int paymentNo);
}
