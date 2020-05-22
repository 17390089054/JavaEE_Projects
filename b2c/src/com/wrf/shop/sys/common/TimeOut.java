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

@WebServlet("/TimeOut.do")
public class TimeOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/jsp/sys/loginTimeOut.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取前台数据
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		//获取application
		ServletContext application = request.getServletContext();
		User user=(User)application.getAttribute("user");
		//校验数据的正确性
		if(user!=null){
			if(user.getPassword().equals(password)){
				//重新给User赋值
				session.setAttribute("user", user);
				response.sendRedirect("Index.do");
			}else
			{
				request.setAttribute("msg", "密码错误,请重新输入");
				request.getRequestDispatcher("WEB-INF/jsp/sys/loginTimeOut.jsp").forward(request, response);
			}
		}
		
	}

}
