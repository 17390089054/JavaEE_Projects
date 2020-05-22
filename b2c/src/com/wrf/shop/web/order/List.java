package com.wrf.shop.web.order;
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
import com.wrf.shop.sys.services.GoodsOrderServices;
import com.wrf.shop.sys.util.JsonUtil;
import com.wrf.shop.sys.util.Tools;
@WebServlet("/orderList.a")
public class List extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询本人订单列表
		GoodsOrderServices gs=new GoodsOrderServices();
		//获取本人信息
		HttpSession session = request.getSession();
		Client client=(Client)session.getAttribute("client");
		Integer c_id = client.getC_id();
		request.setAttribute("list", gs.selectGoodsOrder(c_id));
		request.getRequestDispatcher("WEB-INF/jsp/web/account/order.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//接收前台参数
		String go_id = request.getParameter("go_id");
		//定义结果返回至前台
		Map<String,Object>map=new HashMap<>();
		if(go_id!=null){
			try {
				GoodsOrderServices gs=new GoodsOrderServices();
				map.put("flag", true);
				map.put("msg", "收货成功!");
				gs.reviseStatus(Integer.parseInt(go_id), 4, Tools.getNow());
			} catch (Exception e) {
				map.put("flag", false);
				map.put("msg", e.getMessage());
				e.printStackTrace();
			}
		}
		JsonUtil.Print(response, map);
		
	}

}
