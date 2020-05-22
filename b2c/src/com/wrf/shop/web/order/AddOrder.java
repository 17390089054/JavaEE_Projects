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
import com.wrf.shop.sys.model.GoodsOrder;
import com.wrf.shop.sys.services.GoodsOrderServices;
import com.wrf.shop.sys.util.JsonUtil;
import com.wrf.shop.sys.util.RandomUtil;
import com.wrf.shop.sys.util.Tools;

@WebServlet("/addOrder.a")
public class AddOrder extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		String g_id = request.getParameter("g_id");
		String a_id = request.getParameter("a_id");
		String t_price=request.getParameter("totalPrice");
		String num = request.getParameter("num");
		//获取订单编号
		String orderNum = RandomUtil.getOrderNo();
		//获取用户ID
		HttpSession session = request.getSession();
		Client client = (Client)session.getAttribute("client");
		Integer c_id = client.getC_id();
		//获取创建时间
		String now = Tools.getNow();
		//实例化订单Bean
		GoodsOrder gs=new GoodsOrder();
		gs.setGo_code(orderNum);
		if(a_id!=null){
			gs.setGo_address_id(Integer.parseInt(a_id));
		}
		if(g_id!=null){
			gs.setGo_goods_id(Integer.parseInt(g_id));
		}		
		gs.setGo_client_id(c_id);
		gs.setGo_create_time(now);
		gs.setGo_money(t_price);
		//System.out.println(gs);
		//执行操作
		Map<String,Object>map=new HashMap<>();
		GoodsOrderServices  gos=new GoodsOrderServices();
		try {
			gos.addGoodsOrder(gs,Integer.parseInt(num));
			map.put("flag", true);
			map.put("msg", "提交成功");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("flag", false);
			map.put("msg",e.getMessage());
		}
		JsonUtil.Print(response,map);
		
	}

}
