package com.wrf.shop.sys.goodsType;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.GoodsTypeServices;
import com.wrf.shop.sys.util.JsonUtil;

@WebServlet("/addParent.do")
public class AddParent extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/jsp/sys/goodsType/addParent.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询结果
		Map<String,Object>map=new HashMap<>();
		//接收前台参数
		String gt_name = request.getParameter("gt_name");
		if(gt_name!=null){
			GoodsTypeServices gs=new GoodsTypeServices();
			try {
				gs.checkGoodsNum(gt_name);
				gs.addParent(gt_name);
				map.put("flag", true);
				map.put("msg", "添加成功!");
			} catch (Exception e) {
				map.put("flag", false);
				map.put("msg", e.getMessage());
			}
		}
		JsonUtil.Print(response, map);
	}

}
