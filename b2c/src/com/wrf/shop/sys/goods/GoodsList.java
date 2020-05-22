package com.wrf.shop.sys.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.GoodsServices;
@WebServlet("/goodsList.do")
public class GoodsList extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GoodsServices gs=new GoodsServices();
		request.setAttribute("goodsList", gs.selectGoods());
		request.getRequestDispatcher("WEB-INF/jsp/sys/goods/list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
