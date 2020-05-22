package com.wrf.shop.web.collect;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.CollectServices;
import com.wrf.shop.sys.util.JsonUtil;
@WebServlet("/deleteCollection.a")
public class DeleteCollection extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//接收前台参数
		String co_id= request.getParameter("co_id");
		//执行结果
		Map<String,Object>map=new HashMap<>();
		if(co_id!=null){
			CollectServices cs=new CollectServices();
			try {
				cs.deleteCollection(Integer.parseInt(co_id));
				map.put("flag", true);
				map.put("msg","删除成功!");
			} catch (Exception e) {
				map.put("flag", true);
				map.put("msg",e.getMessage());
				e.printStackTrace();
			}
		}
		JsonUtil.Print(response, map);
	}

}
