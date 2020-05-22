package com.wrf.shop.web.car;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.ShopCarServices;
import com.wrf.shop.sys.util.JsonUtil;
@WebServlet("/delCarItem.a")
public class DelCarItem extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//接收前台参数
		String sc_id = request.getParameter("sc_id");
		//反馈回前台
		Map<String,Object>map=new HashMap<>();
		//删除商品
		if(sc_id!=null){
			ShopCarServices sc=new ShopCarServices();
			try {
				sc.deleteCarItem(Integer.parseInt(sc_id));
				//map.put("flag", true);
				map.put("msg", "删除成功!");
			} catch (Exception e) {
				//map.put("flag", false);
				map.put("msg", e.getMessage());
				e.printStackTrace();
			}
		}
		JsonUtil.Print(response, map);
		
		
		
	}

}
