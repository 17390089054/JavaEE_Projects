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

@WebServlet("/getCity")
public class GetCity extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//查询省份下的城市信息
		String pro_id = request.getParameter("province_id");
		if(pro_id!=null){
			AddressServices as=new AddressServices();
			List<Map<String, Object>> cityList = as.cityList(Integer.parseInt(pro_id));
			JsonUtil.Print(response, cityList);
		}
	}

}
