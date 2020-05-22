package com.wrf.shop.web.client;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.GoodsOrderServices;
import com.wrf.shop.sys.util.JsonUtil;

@WebServlet("/clientPay")
public class ClientPay extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//回显前台参数
		String go_id = request.getParameter("go_id");
		if(go_id!=null){			
			request.setAttribute("go_id", go_id);
			request.getRequestDispatcher("WEB-INF/jsp/web/client/pay.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("WEB-INF/jsp/web/shop/pay.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//反馈执行结果
		Map<String,Object>map=new HashMap<>();
		//接收全台参数
		String go_id = request.getParameter("go_id");
		if(go_id!=null){
			//修改数据库
			GoodsOrderServices gos=new GoodsOrderServices();
			try {
				gos.reviseStatus(go_id);
				map.put("flag", true);
				map.put("msg", "支付成功!");
			} catch (Exception e) {
				map.put("flag", false);
				map.put("msg", e.getMessage());
				e.printStackTrace();
			}
		}
		JsonUtil.Print(response, map);
		
		
	}

}
