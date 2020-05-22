package com.wrf.shop.web.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.ClientServices;

@WebServlet("/findPsw")
public class FindPsw extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String c_account = request.getParameter("c_account");
		request.setAttribute("c_account", c_account);
		request.getRequestDispatcher("WEB-INF/jsp/web/client/find.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//联系方式
		String c_tel = request.getParameter("c_tel");
		String c_account = request.getParameter("c_account");
		//验证手机号是否存在库中
		ClientServices cs=new ClientServices();
		try {
			cs.queryPassword(c_tel);
			response.sendRedirect("revisePsw?c_account="+c_account);
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("WEB-INF/jsp/web/client/find.jsp").forward(request, response);
		}
		
	}

}
