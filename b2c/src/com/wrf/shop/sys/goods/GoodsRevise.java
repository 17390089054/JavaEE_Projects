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
import com.wrf.shop.sys.services.GoodsServices;
import com.wrf.shop.sys.services.GoodsTypeServices;
import com.wrf.shop.sys.util.Tools;
import com.wrf.shop.sys.util.UploadUtil;
@WebServlet("/goodsRevise.do")
public class GoodsRevise extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询商品信息
		String g_id = request.getParameter("g_id");
		if(g_id!=null){
			GoodsServices gs=new GoodsServices();
			request.setAttribute("goods", gs.queryGoods(Integer.parseInt(g_id)));
			request.setAttribute("old_g_logo", gs.queryGoods(Integer.parseInt(g_id)).getG_logo());
		}
		//查询商品类别
		GoodsTypeServices gt=new GoodsTypeServices();
		request.setAttribute("parentList", gt.selectParent());
		request.setAttribute("childList", gt.selectChildren());
		request.getRequestDispatcher("WEB-INF/jsp/sys/goods/revise.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收参数
		Map<String, Object> map = UploadUtil.upload(request, "resource/img/goods");
		String old_g_logo = map.get("old_g_logo").toString();
		request.setAttribute("old_g_logo", old_g_logo);
		Goods goods=new Goods();
		if(map!=null){
			try {
				BeanUtils.populate(goods, map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(goods.getG_logo()==null){
			goods.setG_logo(old_g_logo);
		}
		//System.out.println(goods);
		GoodsServices gs=new GoodsServices();
		try {
			gs.ReviseGoods(goods);
			Tools.messageLogin(response, "修改成功!");
		} catch (Exception e) {
			Tools.message(response, e.getMessage());
		}
		
	}

}
