package com.wrf.shop.web.car;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.services.ShopCarServices;
@WebServlet("/shopCarList.a")
public class ShopCarList extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询用户购物车商品列表 商品总数量 商品订单总价 
		HttpSession session = request.getSession();
		Client client=(Client)session.getAttribute("client");
		ShopCarServices sc=new ShopCarServices();
		session.setAttribute("sum", sc.selectNum(client.getC_id()));
		session.setAttribute("totalPrice", sc.selectTotalPrice(client.getC_id()));
		session.setAttribute("carList", sc.shopCarList(client.getC_id()));
		//System.out.println(sc.shopCarList(client.getC_id()));
		session.setAttribute("client", client);
		//转发到个人中心的购物车
		request.getRequestDispatcher("WEB-INF/jsp/web/car/list.jsp").forward(request, response);
	}
}
