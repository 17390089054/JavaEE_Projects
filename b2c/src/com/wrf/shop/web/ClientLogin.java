package com.wrf.shop.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.services.ClientServices;
import com.wrf.shop.sys.util.Tools;

@WebServlet("/clientLogin")
public class ClientLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/jsp/web/shop/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收前台参数
		String c_account=request.getParameter("c_account");
		String c_password=request.getParameter("c_password");
		//判断登录
		if(c_account!=null&&c_password!=null){
			try {
				ClientServices cs=new ClientServices();
				Client client=cs.Login(c_account, c_password);
				System.out.println(client);
				HttpSession session = request.getSession();
				session.setAttribute("client", client);
				Tools.messageLogin(response, "登录成功!");
			} catch (Exception e) {
				//回显
				request.setAttribute("msg", e.getMessage());
				request.setAttribute("c_account", c_account);
				request.getRequestDispatcher("WEB-INF/jsp/web/shop/login.jsp").forward(request, response);
			}
		}
		
	}

}
