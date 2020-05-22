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

@WebServlet("/deleteGoodsType.do")
public class DeleteGoodsType extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询结果
		Map<String,Object>map=new HashMap<>();
		//接收前台参数
		String gt_id=request.getParameter("gt_id");
		String gt_parent_id=request.getParameter("gt_parent_id");
		//父元素
		if(gt_id!=null&&gt_parent_id==null){
			GoodsTypeServices gs=new GoodsTypeServices();
			try {
				gs.queryParentGoodsTypeCount(Integer.parseInt(gt_id));
				gs.deleteGoodsType(Integer.parseInt(gt_id));
				map.put("flag", true);
				map.put("msg", "删除成功!");
			} catch (Exception e) {
				map.put("flag", false);
				map.put("msg", e.getMessage());
			}
		}
		//子元素
		if(gt_id!=null&&gt_parent_id!=null){
			GoodsTypeServices gs=new GoodsTypeServices();
			try {
				gs.deleteGoodsType(Integer.parseInt(gt_id));
				map.put("flag", true);
				map.put("msg", "删除成功!");
			} catch (Exception e) {
				map.put("flag", false);
				map.put("msg", e.getMessage());
			}
		}
		
		
		JsonUtil.Print(response, map);
	}

}
