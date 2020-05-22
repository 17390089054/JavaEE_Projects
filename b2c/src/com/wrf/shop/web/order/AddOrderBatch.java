package com.wrf.shop.web.order;

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

import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.model.GoodsOrder;
import com.wrf.shop.sys.services.GoodsOrderServices;
import com.wrf.shop.sys.services.ShopCarServices;
import com.wrf.shop.sys.util.JsonUtil;
import com.wrf.shop.sys.util.RandomUtil;
import com.wrf.shop.sys.util.Tools;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@WebServlet("/addOrderBatch.a")
public class AddOrderBatch extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//反馈执行状态
		Map<String,Object>map=new HashMap<>();
		//订单请求数组
		List<GoodsOrder>orderList=new ArrayList<>();
		//接收订单数组 
		String list=request.getParameter("ordersArr");
		//订单类型num 1未支付  2已支付
		String num = request.getParameter("num");
		
		//定义一个数组存放购物车ID
		List<Integer>cList=new ArrayList<>();
		
		//解析json对象
		JSONArray jsonArray = JSONArray.fromObject(list);
		for(int i=0;i<jsonArray.size();i++){
			//逐条解析JSON 并转换成GoodsOrder对象
			JSONObject jb = jsonArray.getJSONObject(i);
			GoodsOrder go=new GoodsOrder();
			go.setGo_money(jb.get("totalPrice").toString());
			go.setGo_address_id(Integer.parseInt(jb.get("addr_id").toString()));
			go.setGo_goods_id(Integer.parseInt(jb.get("g_id").toString()));
			go.setGo_client_id(Integer.parseInt(jb.get("c_id").toString()));
			go.setGo_create_time(Tools.getNow());
			go.setGo_code(RandomUtil.getOrderNo());
			orderList.add(go);
			//添加购物车ID
			cList.add(jb.getInt("sc_id"));
			
		}
		
		//订单添加进入数据库
		GoodsOrderServices gos=new GoodsOrderServices();
		try {
			gos.addGoodsOrder(orderList, Integer.parseInt(num));
			//清空购物车
			ShopCarServices ss=new ShopCarServices();
			ss.deleteCarItem(cList);
			//更新购物车
			//查询用户购物车商品列表 商品总数量 商品订单总价 
			HttpSession session = request.getSession();
			Client client =(Client)session.getAttribute("client");
			ShopCarServices sc=new ShopCarServices();
			session.setAttribute("sum", sc.selectNum(client.getC_id()));
			session.setAttribute("totalPrice", sc.selectTotalPrice(client.getC_id()));
			session.setAttribute("carList", sc.shopCarList(client.getC_id()));
			//提示信息
			map.put("flag", true);
			map.put("msg", "提交成功!");
		} catch (Exception e) {
			map.put("flag", true);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		
		
	JsonUtil.Print(response, map);
	
	}
}
