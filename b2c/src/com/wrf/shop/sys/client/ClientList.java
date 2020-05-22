package com.wrf.shop.sys.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.services.ClientServices;
@WebServlet("/clietList.do")
public class ClientList extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*查询客户列表*/
		ClientServices cs=new ClientServices();
		request.setAttribute("list",cs.queryList());
		request.getRequestDispatcher("WEB-INF/jsp/sys/client/list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
