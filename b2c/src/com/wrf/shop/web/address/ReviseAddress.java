package com.wrf.shop.web.address;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.services.AddressServices;
import com.wrf.shop.sys.util.JsonUtil;
@WebServlet("/addressRevise.a")
public class ReviseAddress extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//接收前台参数
		String a_id = request.getParameter("a_id");
		//定义返回结果
		Map<String,Object>map=new HashMap<>();
		if(a_id!=null){
			AddressServices as=new AddressServices();
			try {
				as.reviseStatus(Integer.parseInt(a_id));
				map.put("flag", true);
				map.put("msg", "设置成功!");
			} catch (Exception e) {
				map.put("flag", false);
				map.put("msg", e.getMessage());
				e.printStackTrace();
			}
		}
		JsonUtil.Print(response, map);
	}

}
