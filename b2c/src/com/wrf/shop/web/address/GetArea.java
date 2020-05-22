package com.wrf.shop.web.address;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.AddressServices;
import com.wrf.shop.sys.util.JsonUtil;

@WebServlet("/getArea")
public class GetArea extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//查询省份下的城市信息
		String city_id = request.getParameter("city_id");
		if(city_id!=null){
			AddressServices as=new AddressServices();
			List<Map<String, Object>> areaList = as.areaList(Integer.parseInt(city_id));
			JsonUtil.Print(response, areaList);
		}
	}

}
