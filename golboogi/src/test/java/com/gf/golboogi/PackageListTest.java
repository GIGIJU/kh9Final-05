package com.gf.golboogi;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class PackageListTest {
	
	@Autowired
	private SqlSession sqlSession;
	
//	@Test
	public void test() {
//		List list = sqlSession.selectList("package.list");
//		System.out.println(list.size());
	}
	
}
