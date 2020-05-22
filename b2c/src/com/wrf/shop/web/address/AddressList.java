package com.wrf.shop.web.address;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.services.AddressServices;
@WebServlet("/addressList.a")
public class AddressList extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询当前用户地址信息
		HttpSession session=request.getSession();
		Client client=(Client)session.getAttribute("client");
		Integer c_id = client.getC_id();
		AddressServices as=new AddressServices();
		request.setAttribute("list", as.addrList(c_id));
		request.getRequestDispatcher("WEB-INF/jsp/web/address/list.jsp").forward(request,response);
	}
}
