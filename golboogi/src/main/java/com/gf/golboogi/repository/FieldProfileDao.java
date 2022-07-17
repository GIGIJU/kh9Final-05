package com.gf.golboogi.repository;

import java.util.List;
import java.util.Map;

import com.gf.golboogi.vo.FieldProfileVO;

public interface FieldProfileDao {
	
	
	void insert(int fieldNo, int attachmentNo);

	int info(int fieldNo);

	List<FieldProfileVO> multiInfo(int fieldNo);




}
