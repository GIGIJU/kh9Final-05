package com.gf.golboogi.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.gf.golboogi.intercepter.AdminLoginInterceptor;
import com.gf.golboogi.intercepter.MemberLoginInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//회원 로그인
		registry.addInterceptor(new MemberLoginInterceptor())
		// 회원 로그인이 필요한 부분
		.addPathPatterns("/member/**")
		.addPathPatterns("/review/**")
		// 회원 로그인이 필요하지 않음 부분
		.excludePathPatterns("/member/login")
		.excludePathPatterns("/member/join")
		.excludePathPatterns("/member/join_success")
		.excludePathPatterns("/member/find_id")
		.excludePathPatterns("/member/find_id_success")
		.excludePathPatterns("/member/find_pw")
		.excludePathPatterns("/member/find_pw_send_mail")
		.excludePathPatterns("/member/reset")
		.excludePathPatterns("/memberr/reset_success")
		.excludePathPatterns("/review/list")
		.excludePathPatterns("/review/delete/**") //관리자가 삭제하기 위해서
		.excludePathPatterns("/review/detail/**");
		
		
		//관리자 로그인 
		registry.addInterceptor(new AdminLoginInterceptor())
		// 관리자 로그인 필요한 부분
		.addPathPatterns("/admin/**")
		.addPathPatterns("/manager/**")
		.addPathPatterns("/notice/**")
		
		// 관리자 로그인 필요하지 않은 부분
		.excludePathPatterns("/admin/login")
		.excludePathPatterns("/admin/join")
		.excludePathPatterns("/notice/list")
		.excludePathPatterns("/notice/detail/**");
		
	
	
}
}
