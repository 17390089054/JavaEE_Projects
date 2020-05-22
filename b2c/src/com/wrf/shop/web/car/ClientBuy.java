package com.wrf.shop.web.car;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrf.shop.sys.model.Address;
import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.services.AddressServices;

@WebServlet("/clientBuy.a")
public class ClientBuy extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询本人收货地址
		HttpSession session = request.getSession();
		Client client=(Client)session.getAttribute("client");
		//查询收货地址
		AddressServices as=new AddressServices();
		List<Address> addrList = as.addrList(client.getC_id());
		//请求转发
		request.setAttribute("list", addrList);
		request.getRequestDispatcher("WEB-INF/jsp/web/car/buy.jsp").forward(request, response);
		
	}
}
