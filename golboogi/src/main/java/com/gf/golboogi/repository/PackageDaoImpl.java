package com.gf.golboogi.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.PackageDto;

@Repository
public class PackageDaoImpl implements PackageDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PackageDto> list() {
		return sqlSession.selectList("package.list");
	}

	@Override
	public PackageDto insert(PackageDto packageDto) {
		int sequence = sqlSession.selectOne("package.sequence");
		sqlSession.insert("package.insert", packageDto);
		return packageDto;
	}

	@Override
	public PackageDto one(int packageNo) {
		return sqlSession.selectOne("package.one",packageNo);
	}
}
