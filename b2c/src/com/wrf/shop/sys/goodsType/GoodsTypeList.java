package com.wrf.shop.sys.goodsType;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.model.GoodsType;
import com.wrf.shop.sys.services.GoodsTypeServices;

@WebServlet("/goodsTypeList.do")
public class GoodsTypeList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询商品类别信息后回显
		GoodsTypeServices gs=new GoodsTypeServices();
		List<GoodsType> childList = gs.selectChildren();
		List<GoodsType> parentList = gs.selectParent();
		request.setAttribute("childList", childList);
		request.setAttribute("parentList", parentList);
		request.getRequestDispatcher("WEB-INF/jsp/sys/goodsType/list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
