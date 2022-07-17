package com.gf.golboogi.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
//@Slf4j
@Component
public class MemberLoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		log.info("====== preHandler START =====");
//		log.info("Request URL : {}", request.getRequestURI());

		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("login");
		if(memberId == null) {
			response.sendRedirect("/member/login");
			return false;
		}
		return true;
	}
	
}
