package com.wrf.shop.sys.common;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrf.shop.sys.model.User;
import com.wrf.shop.sys.services.LoginService;

/**
 * @author knight  
 * @date: 2018年2月13日  下午3:38:24
 * 用户登录控制核心类
 */
@WebServlet("/Login.do")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		//请求转发至登录页面
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("WEB-INF/jsp/sys/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		//设置字符编码
		response.setCharacterEncoding("utf-8");
		//接收前台参数
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		//调用LoginServices
		try {
			User user=LoginService.Login(account, password);
			//存入session
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			//存入application
			ServletContext application = request.getServletContext();
			application.setAttribute("user",user);
			response.sendRedirect("Index.do");
		} catch (Exception e) {
			request.setAttribute("account",account);
			request.setAttribute("msg",e.getMessage());
			request.getRequestDispatcher("WEB-INF/jsp/sys/login.jsp").forward(request, response);
		}
		
		
		
		
		
	}

}