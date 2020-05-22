package com.wrf.shop.web.collect;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.services.ClientServices;
import com.wrf.shop.sys.util.JsonUtil;
import com.wrf.shop.sys.util.Tools;

@WebServlet("/collect.a")
public class Collect extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收前台参数
		String g_id = request.getParameter("g_id");
		if(g_id!=null){
			HttpSession session = request.getSession();
			Client client= (Client)session.getAttribute("client");
			Integer c_id = client.getC_id();
			String date = Tools.getNow();
			ClientServices cs = new ClientServices();
			try {
				cs.Collect(Integer.parseInt(g_id), c_id, date);
				Tools.messageBox(response, "收藏成功!");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		Map<String,Object>map=new HashMap<>();
		//接收前台参数
		String g_id = request.getParameter("g_id");
		if(g_id!=null){
			HttpSession session = request.getSession();
			Client client= (Client)session.getAttribute("client");
			Integer c_id = client.getC_id();
			String date = Tools.getNow();
			ClientServices cs = new ClientServices();
			try {
				cs.Collect(Integer.parseInt(g_id), c_id, date);
				map.put("msg", "收藏成功!");
			} catch (Exception e) {
				map.put("msg", "收藏成功!");
				e.printStackTrace();
			}
		}
		JsonUtil.Print(response, map);
	}

}
