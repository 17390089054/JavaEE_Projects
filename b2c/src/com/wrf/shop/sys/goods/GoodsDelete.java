package com.wrf.shop.sys.goods;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.GoodsServices;
import com.wrf.shop.sys.util.JsonUtil;

@WebServlet("/goodsDelete.do")
public class GoodsDelete extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//设置执行信息
	Map<String,Object>map=new HashMap<>();	
	//接收前台参数
	String g_id=request.getParameter("g_id");
	if(g_id!=null){
		GoodsServices gs=new GoodsServices();
		try {
			gs.deleteGoods(Integer.parseInt(g_id));
			map.put("flag", true);
			map.put("msg", "下架成功");
		} catch (Exception e) {
			map.put("flag", false);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
	}
	JsonUtil.Print(response, map);
	}

}
