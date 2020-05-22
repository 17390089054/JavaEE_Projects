package com.wrf.rbac.common.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.wrf.rbac.common.Util.Constants;

public class SessionInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//1.获取Session
		HttpSession session=request.getSession();
		//2.判断用户是否存在
		if(session.getAttribute(Constants.SESSION_USER)==null) {
			//3.跳转到登录页面
			response.sendRedirect(request.getContextPath()+"/sys/login");
			return false;
		}
		return true;
	}



}
