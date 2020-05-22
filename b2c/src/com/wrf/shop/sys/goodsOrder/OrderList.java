package com.wrf.shop.sys.goodsOrder;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.GoodsOrderServices;

@WebServlet("/orderList.do")
public class OrderList extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询订单全部信息
		GoodsOrderServices gs=new GoodsOrderServices();
		request.setAttribute("list", gs.selectGoodsOrder());
		request.getRequestDispatcher("WEB-INF/jsp/sys/goodsOrder/list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
