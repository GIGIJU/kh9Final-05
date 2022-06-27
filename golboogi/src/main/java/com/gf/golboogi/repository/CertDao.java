package com.gf.golboogi.repository;

import com.gf.golboogi.entity.CertDto;

public interface CertDao {
	void insert(CertDto certDto);
	
	boolean check(CertDto certDto);
	
	void clear();
}
