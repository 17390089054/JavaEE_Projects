package com.wrf.shop.sys.goodsType;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.model.GoodsType;
import com.wrf.shop.sys.services.GoodsTypeServices;
import com.wrf.shop.sys.util.JsonUtil;

@WebServlet("/addChild.do")
public class AddChild extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取父商品信息
		String gt_id=request.getParameter("gt_id");
		if(gt_id!=null){
			GoodsTypeServices gs=new GoodsTypeServices();
			GoodsType queryGoodsType = gs.queryGoodsType(Integer.parseInt(gt_id));
			request.setAttribute("gt_id", gt_id);
			request.setAttribute("map",queryGoodsType);
			request.getRequestDispatcher("WEB-INF/jsp/sys/goodsType/addChild.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询结果
		Map<String,Object>map=new HashMap<>();
		//接收前台参数
		String gt_name = request.getParameter("gt_name");
		String gt_parent_id=request.getParameter("gt_parent_id");
		if(gt_name!=null&&gt_parent_id!=null){
			GoodsTypeServices gs=new GoodsTypeServices();
			try {
				gs.checkGoodsNum(gt_name);
				gs.addChild(gt_name, Integer.parseInt(gt_parent_id));
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
