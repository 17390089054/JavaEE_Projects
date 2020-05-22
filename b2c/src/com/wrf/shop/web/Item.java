package com.wrf.shop.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.model.Goods;
import com.wrf.shop.sys.services.GoodsServices;
@WebServlet("/item")
/**
 @ClassName Item
 * @Description 商品详情类 
 * @Author invincible
 * @Date 2018年3月7日 上午11:29:28
 */
public class Item extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收前台参数
		String g_id = request.getParameter("g_id");
		//查询商品信息
		if(g_id!=null){
			GoodsServices gs=new GoodsServices();
			Goods item = gs.getGoodsItem(Integer.parseInt(g_id));
			//查询相似产品
			String gt_name = item.getGt_name();
			request.setAttribute("goodsAlike", gs.selectGoodsAlike(gt_name));
			//查询其他商品
			request.setAttribute("goodsList", gs.selectOtherGoods());
			request.setAttribute("item", item);
			request.getRequestDispatcher("WEB-INF/jsp/web/shop/item.jsp").forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
