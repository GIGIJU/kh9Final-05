package com.gf.golboogi;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

// 이 파일은 프로젝트 생성 시 배포방식을 "war"로 지정한 경우만 생기는 파일이다.
// 이 파일은 web.xml을 대신하는 역할을 수행한다.
// 필요한 web.xml 설정이 있다면 "자바 설정파일"로 설정해야 한다.
public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(GolboogiApplication.class);
	}

}
