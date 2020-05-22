package com.wrf.shop.web.car;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrf.shop.sys.model.ShopCar;
import com.wrf.shop.sys.services.ShopCarServices;
import com.wrf.shop.sys.util.JsonUtil;

@WebServlet("/addToPay.a")
public class AddToPay extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//接收前台数组
		String[] array = request.getParameterValues("array[]");
		//返回查询结果
		List<ShopCar>shopCarList=new ArrayList<>();
		//查询购物车所选所有商品的信息
		ShopCarServices scs=new ShopCarServices();
		for(String  string:array){
			shopCarList.add(scs.queryShopCar(Integer.parseInt(string)));
		}
		//接收总价格数和商品列表
		String payTotal = request.getParameter("payTotal");
		//System.out.println(payTotal);
		//System.out.println(shopCarList);
		//结果存入session
		HttpSession session = request.getSession();
		session.setAttribute("shopCarList", shopCarList);
		session.setAttribute("payTotal", payTotal);
		//返回执行结果
		Map<String,Object>map=new HashMap<>();
		map.put("msg", "提交成功!");
		JsonUtil.Print(response, map);
	}

}
