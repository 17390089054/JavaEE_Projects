package com.wrf.shop.sys.client;

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
import com.wrf.shop.sys.util.Tools;

/**
 @ClassName ChangeAccount
 * @Description  账号切换控制类
 * @Author invincible
 * @Date 2018年5月5日 下午9:54:55
 */

@WebServlet("/changeAccount.do")
public class ChangeAccount extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/WEB-INF/jsp/sys/changeAccount.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			Tools.userChange(response, "切换账号成功!");
		} catch (Exception e) {
			request.setAttribute("account",account);
			request.setAttribute("msg",e.getMessage());
			request.getRequestDispatcher("WEB-INF/jsp/sys/login.jsp").forward(request, response);
		}
	}
	
}
