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
		.addPathPatterns("/admin/**")
		.addPathPatterns("/review/**")
		// 회원 로그인이 필요하지 않음 부분
		.excludePathPatterns("/admin/member_list")
		.excludePathPatterns("/admin/list")
		.excludePathPatterns("/admin/login")
		.excludePathPatterns("/admin/logout")
		.excludePathPatterns("/member/login")
		.excludePathPatterns("/member/join")
		.excludePathPatterns("/member/join_success")
		.excludePathPatterns("/member/find_id")
		.excludePathPatterns("/member/find_id_success")
		.excludePathPatterns("/member/find_pw")
		.excludePathPatterns("/member/find_pw_send_mail")
		.excludePathPatterns("/member/reset")
		.excludePathPatterns("/memberr/reset_success")
		.excludePathPatterns("/notice/edit/**")
		.excludePathPatterns("/review/list")
		.excludePathPatterns("/review/detail/**");
		
		
		//관리자 로그인 
		registry.addInterceptor(new AdminLoginInterceptor())
		// 관리자 로그인 필요한 부분
		.addPathPatterns("/admin/**")
		.addPathPatterns("/member/login")
		.addPathPatterns("/member/join")
		.addPathPatterns("/notice/delete/{noticeNo}")
		.addPathPatterns("/manager/stat/**")
		.addPathPatterns("/manager/charts/**")
		.addPathPatterns("/manager/tables/**")
		.addPathPatterns("/manager/payment/**")
		.addPathPatterns("/notice/write")
		
		// 관리자 로그인 필요하지 않은 부분
		.excludePathPatterns("/admin/login")
		.excludePathPatterns("/admin/join")
		.excludePathPatterns("/review/delete/**");
		
	}
	
	
}
