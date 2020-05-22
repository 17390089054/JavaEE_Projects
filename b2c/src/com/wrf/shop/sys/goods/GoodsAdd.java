package com.wrf.shop.sys.goods;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.wrf.shop.sys.model.Goods;
import com.wrf.shop.sys.model.User;
import com.wrf.shop.sys.services.GoodsServices;
import com.wrf.shop.sys.services.GoodsTypeServices;
import com.wrf.shop.sys.util.Tools;
import com.wrf.shop.sys.util.UploadUtil;

@WebServlet("/goodsAdd.do")
public class GoodsAdd extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询商品类型信息
		GoodsTypeServices gs=new GoodsTypeServices();
		request.setAttribute("parentList", gs.selectParent());
		request.setAttribute("childList", gs.selectChildren());
		request.getRequestDispatcher("WEB-INF/jsp/sys/goods/add.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收前台参数
		Map<String, Object> map = UploadUtil.upload(request, "resource/upload");
		//获取user_id
		User user =(User)request.getSession().getAttribute("user");
		Integer user_id = user.getUser_id();
		//获取商品类创建时间
		String date = Tools.getNow();
		//转换为Goods
		Goods goods=new Goods();
		goods.setG_user_id(user_id);
		goods.setG_create_time(date);
		try {
			BeanUtils.populate(goods, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int g_id=0;
		//添加商品
		GoodsServices gs=new GoodsServices();
		try {
			g_id=gs.addGoods(goods);
			response.sendRedirect("addGoodsMany.do?g_id="+g_id);
		} catch (Exception e) {
			e.printStackTrace();
			Tools.message(response, "添加失败");
		}
		
		
		
	}

}
