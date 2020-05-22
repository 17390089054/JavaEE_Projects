
package com.wrf.shop.web.car;

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
import com.wrf.shop.sys.model.Goods;
import com.wrf.shop.sys.model.ShopCar;
import com.wrf.shop.sys.services.GoodsServices;
import com.wrf.shop.sys.services.ShopCarServices;
import com.wrf.shop.sys.util.JsonUtil;
import com.wrf.shop.sys.util.Tools;

@WebServlet("/addToCar.a")
public class AddToCar extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//更新用户购物车商品列表 商品总数量 商品订单总价 
		HttpSession session = request.getSession();
		Client client=(Client)session.getAttribute("client");
		ShopCarServices sc=new ShopCarServices();
		session.setAttribute("sum", sc.selectNum(client.getC_id()));
		session.setAttribute("totalPrice", sc.selectTotalPrice(client.getC_id()));
		session.setAttribute("carList", sc.shopCarList(client.getC_id()));
		session.setAttribute("client", client);
		/*//接收前台参数
		String g_id = request.getParameter("g_id");
		//查询商品信息
		GoodsServices gs=new GoodsServices();
		Goods goods = gs.queryGoods(Integer.parseInt(g_id));
		//查询购物车信息
		HttpSession session = request.getSession();
		List<Goods>carList=(List<Goods>)session.getAttribute("car");
		if(carList==null){
			carList=new ArrayList<>();
		}
		carList.add(goods);
		session.setAttribute("car", carList);
		session.setAttribute("list", gs.selectGoodsList());
		response.sendRedirect("Index");*/
		//request.setAttribute("list", gs.selectGoodsList());
		//request.getRequestDispatcher("WEB-INF/jsp/web/shop/index.jsp").forward(request, response);;
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收前台参数
		String g_id = request.getParameter("g_id");
		//执行信息
		Map<String,Object>map=new HashMap<>();
		//获取用户ID
		HttpSession session = request.getSession();
		Client client=(Client)session.getAttribute("client");
		if(client==null){
			map.put("flag", false);
			map.put("msg", "亲,请先登录！");
			map.put("login", true);
			JsonUtil.Print(response, map);
			return;
		}
		Integer c_id = client.getC_id();
		ShopCar sc=new ShopCar();
		//获取商品创建时间
		String now = Tools.getNow();
		sc.setSc_goods_id(Integer.parseInt(g_id));
		sc.setSc_create_time(now);
		sc.setSc_client_id(c_id);
		
		//添加商品
		ShopCarServices scs=new ShopCarServices();
		try {
			scs.addShopCar(sc);
			map.put("flag", true);
			map.put("msg", "添加成功!");
			//更新购物车的信息
			ShopCarServices sC=new ShopCarServices(); 
			session.setAttribute("sum", sC.selectNum(client.getC_id()));
			session.setAttribute("totalPrice", sC.selectTotalPrice(client.getC_id()));
			session.setAttribute("carList", sC.shopCarList(client.getC_id()));
		} catch (Exception e) {
			map.put("flag", false);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		JsonUtil.Print(response, map);
		
		
	}
}
