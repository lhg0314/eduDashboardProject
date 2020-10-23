package com.eduDashboardProject.common;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginAuth implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(request.getRequestURI().contains("notice/")
				&& request.getSession().getAttribute("userInfo")==null) {
			request.setAttribute("alertMsg", "로그인이 필요한 기능입니다");
			request.setAttribute("url", request.getContextPath()+"/user/login");
			RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/jsp/notice/result.jsp");
			rd.forward(request, response);
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	

	

}
