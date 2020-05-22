package com.wrf.shop.sys.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.ClientServices;
import com.wrf.shop.sys.util.Tools;
@WebServlet("/revisePsw")
public class RevisePsw extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收前台参数
		String c_tel = request.getParameter("c_tel");
		request.setAttribute("c_tel", c_tel);
		request.getRequestDispatcher("WEB-INF/jsp/web/shop/revisePsw.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//接收前台参数
		String c_tel = request.getParameter("c_tel");
		String c_password = request.getParameter("c_password");
		if(c_tel!=null&&c_password!=null){
			ClientServices cs=new ClientServices();
			try {
				cs.revisePassword(c_tel, c_password);
				Tools.messageBox(response, "修改成功!");
			} catch (Exception e) {
				request.setAttribute("msg", e.getMessage());
				request.setAttribute("c_password",c_password);
				request.getRequestDispatcher("WEB-INF/jsp/web/shop/revisePsw.jsp").forward(request, response);
			}
		}
		
		
	}

}
