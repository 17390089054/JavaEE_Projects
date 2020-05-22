package com.wrf.shop.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.model.Address;
import com.wrf.shop.sys.model.Goods;
import com.wrf.shop.sys.services.AddressServices;
import com.wrf.shop.sys.services.GoodsServices;

@WebServlet("/buy.a")
public class Buy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String g_id=request.getParameter("g_id");
		if(g_id!=null){
			//查询购买商品的信息
			GoodsServices gs=new GoodsServices();
			Goods goods = gs.getGoodsItem(Integer.parseInt(g_id));
			request.setAttribute("goods", goods);
			//查询收货地址
			AddressServices as=new AddressServices();
			List<Address> addrList = as.addrList();
			request.setAttribute("list", addrList);
			request.getRequestDispatcher("WEB-INF/jsp/web/shop/buy.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
