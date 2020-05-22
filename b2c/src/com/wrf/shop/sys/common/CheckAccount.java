package com.wrf.shop.sys.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.ClientServices;
import com.wrf.shop.sys.util.JsonUtil;

@WebServlet("/checkAccount")
public class CheckAccount extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		String c_account = request.getParameter("c_account");
		//执行状态
		Map<String,Object>map=new HashMap<>();
		//检查账号是否存在
		ClientServices cs=new ClientServices();
		if(cs.isExisted(c_account)){
			map.put("flag",true);
			map.put("msg", "存在此账号");
		}else{
			map.put("flag", false);
			map.put("msg", "不存在该账号");
		}
		//返回至前台
		JsonUtil.Print(response, map);
		
	}

}
