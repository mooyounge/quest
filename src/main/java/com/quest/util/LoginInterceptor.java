package com.quest.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(request.getSession().getAttribute("user") == null) {
			request.setAttribute("msg", "로그인 후 이용 가능합니다.");
			request.setAttribute("url", "/login");
			request.getRequestDispatcher("/WEB-INF/views/error.jsp")
			       .forward(request, response);
			return false;
		}
			return true;
	}
}
