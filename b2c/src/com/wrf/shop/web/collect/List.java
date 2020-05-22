package com.wrf.shop.web.collect;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.services.CollectServices;
@WebServlet(name = "CollectList", urlPatterns = { "/collectList.a" })
public class List extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取当前用户id
		HttpSession session = request.getSession();
		Client client=(Client)session.getAttribute("client");
		int c_id=client.getC_id();
		CollectServices cs=new CollectServices();
		request.setAttribute("list", cs.selectCollections(c_id));
		request.getRequestDispatcher("WEB-INF/jsp/web/collect/list.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
