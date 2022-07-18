package com.gf.golboogi.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.gf.golboogi.intercepter.MemberLoginInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new MemberLoginInterceptor())
		.addPathPatterns("/member/**")
		.addPathPatterns("/notice/**")
		.addPathPatterns("/review/**")
		.excludePathPatterns("/member/login")
		.excludePathPatterns("/member/join")
		.excludePathPatterns("/member/join_success")
		.excludePathPatterns("/member/find_id")
		.excludePathPatterns("/member/find_id_success")
		.excludePathPatterns("/member/find_pw")
		.excludePathPatterns("/member/find_pw_send_mail")
		.excludePathPatterns("/member/reset")
		.excludePathPatterns("/memberr/reset_success")
		.excludePathPatterns("/notice/list")
		.excludePathPatterns("/notice/write")
		.excludePathPatterns("/notice/detail/**")
		.excludePathPatterns("/notice/edit/**")
		.excludePathPatterns("/review/list")
		.excludePathPatterns("/review/detail/**");
	
	}

	
}
