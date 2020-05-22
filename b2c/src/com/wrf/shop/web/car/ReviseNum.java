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
@WebServlet("/reviseNum.a")
public class ReviseNum extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//执行状态
		Map<String,Object>map=new HashMap<>();
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//接收前台参数
		String num = request.getParameter("num");
		String sc_id = request.getParameter("sc_id");
		//修改内容
		if(num!=null&&sc_id!=null){
			ShopCarServices sc=new ShopCarServices();
			try {
				sc.ReviseNum(Integer.parseInt(num), Integer.parseInt(sc_id));
				map.put("msg","修改成功!");
			} catch (Exception e) {
				e.printStackTrace();
				map.put("msg", e.getMessage());
			}
		}
		JsonUtil.Print(response, map);
	}

}
