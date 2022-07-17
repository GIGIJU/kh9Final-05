package com.gf.golboogi;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.PropertySource;

@SpringBootTest
public class PackageListTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
//		List list = sqlSession.selectList("package.list");
//		System.out.println(list.size());
	}
	
}
