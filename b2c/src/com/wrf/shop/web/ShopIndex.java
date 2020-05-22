package com.wrf.shop.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrf.shop.sys.model.Goods;
import com.wrf.shop.sys.services.GoodsServices;
import com.wrf.shop.sys.services.GoodsTypeServices;
import com.wrf.shop.sys.util.JsonUtil;

@WebServlet("/Index")
public class ShopIndex extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询最新商品信息
		GoodsServices gs=new GoodsServices();
		//查询最新的10款商品
		request.setAttribute("list", gs.selectGoodsList());
		//查询各个类别的商品信息
		request.setAttribute("gsList", gs.goodsClassList(1));
		//查询推荐商品信息
		request.setAttribute("gcList", gs.goodsRecommandList(41));
		//查询推荐图片列表
		request.setAttribute("imgList", gs.imgList(9));
		
		//查询商品类别信息
		GoodsTypeServices gts=new GoodsTypeServices();
		HttpSession session = request.getSession();
		session.setAttribute("parentList", gts.selectParent());
		session.setAttribute("childList", gts.selectChildren());
		//查询指定商品信息
		//服饰
		session.setAttribute("clothesList", gts.selectClothes());
		//电器
		session.setAttribute("applianceList", gts.selectAppliance());
		//食品
		session.setAttribute("foodList", gts.selectFood());
		//生活用品
		session.setAttribute("dList", gts.selectDailyGoods());
		
		request.getRequestDispatcher("WEB-INF/jsp/web/shop/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		List<Goods> list=new ArrayList<>();
		//接收前台参数
		String gt_id = request.getParameter("gt_id");
		//查询推荐栏商品列表并返回前台
		if(gt_id!=null){
			GoodsServices gs=new GoodsServices();
			 list= gs.goodsRecommandList(Integer.parseInt(gt_id));
		}
		JsonUtil.Print(response,list);
	}

}
