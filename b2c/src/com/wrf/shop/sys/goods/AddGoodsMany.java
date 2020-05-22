package com.wrf.shop.sys.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.model.Goods;
import com.wrf.shop.sys.model.UploadBean;
import com.wrf.shop.sys.services.GoodsServices;
import com.wrf.shop.sys.util.Tools;
import com.wrf.shop.sys.util.UploadUtil;

@WebServlet("/addGoodsMany.do")
public class AddGoodsMany extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取商品ID
		String g_id=request.getParameter("g_id");
		request.setAttribute("g_id", g_id);
		request.getRequestDispatcher("WEB-INF/jsp/sys/goods/manyFile.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UploadBean upload = UploadUtil.uploadManyFile(request, "resource/img/goods");
		//添加图片
		GoodsServices gs=new GoodsServices();
		try {
			gs.addGoodsMany(upload);
			Tools.message(response, "添加成功!");
		} catch (Exception e) {
			e.printStackTrace();
			Tools.message(response, e.getMessage());
		}
		
		
	}

}
