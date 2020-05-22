package com.wrf.shop.web.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.model.Goods;
import com.wrf.shop.sys.services.GoodsServices;
import com.wrf.shop.sys.services.GoodsTypeServices;
import com.wrf.shop.sys.util.JsonUtil;
@WebServlet("/search")
public class Search extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sc = request.getParameter("search_condition");
		GoodsServices gs=new GoodsServices();
		request.setAttribute("goodsList", gs.searchGoods(sc));
		request.setAttribute("count", gs.goodsCount(sc));
		request.setAttribute("sc", sc);
		
		request.getRequestDispatcher("WEB-INF/jsp/web/shop/search.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//获取前台参数
		String sc = request.getParameter("search_condition");
		String number = request.getParameter("number");
		String type = request.getParameter("type");
		GoodsServices gs=new GoodsServices();
		List<Goods> goodsList = gs.goodsList(sc,Integer.parseInt(number),Integer.parseInt(type));
		JsonUtil.Print(response, goodsList);
	}

}
