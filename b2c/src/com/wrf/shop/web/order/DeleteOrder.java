package com.wrf.shop.web.order;

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

@WebServlet("/deleteOrder.a")
public class DeleteOrder extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//接收前台参数
		String go_id = request.getParameter("go_id");
		//提示
		Map<String,Object>map=new HashMap<>();
		//删除商品
		if(go_id!=null){
			GoodsOrderServices gos=new GoodsOrderServices();
			try {
				gos.deleteOrder(Integer.parseInt(go_id));
				map.put("flag", true);
				map.put("msg", "删除成功!");
			} catch (Exception e) {
				map.put("flag", false);
				map.put("msg", "删除失败");
				e.printStackTrace();
			}
			
		}
		JsonUtil.Print(response, map);
	}

}
