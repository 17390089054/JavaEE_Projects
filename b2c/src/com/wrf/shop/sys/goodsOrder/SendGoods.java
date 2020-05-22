package com.wrf.shop.sys.goodsOrder;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.GoodsOrderServices;
import com.wrf.shop.sys.util.JsonUtil;

@WebServlet("/sendGoods.do")
public class SendGoods extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//接收前台参数
		String go_id= request.getParameter("go_id");
		//执行状态
		Map<String,Object>map=new HashMap<>();
		if(go_id!=null){
			GoodsOrderServices gs=new GoodsOrderServices();
			try {
				gs.reviseStatus(Integer.parseInt(go_id));
				map.put("flag",true);
				map.put("msg", "发货成功!");
			} catch (Exception e) {
				map.put("flag", false);
				map.put("msg", e.getMessage());
				e.printStackTrace();
			}
		}
		JsonUtil.Print(response, map);
	}

}
