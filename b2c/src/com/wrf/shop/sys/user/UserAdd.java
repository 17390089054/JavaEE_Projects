package com.wrf.shop.sys.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;
import com.wrf.shop.sys.model.User;
import com.wrf.shop.sys.services.UserServices;
import com.wrf.shop.sys.util.DateUtil;
import com.wrf.shop.sys.util.JsonUtil;

@WebServlet("/userAdd.do")
public class UserAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询用户角色列表
		UserServices us=new UserServices();
		request.setAttribute("roleList", us.queryRole());
		request.getRequestDispatcher("WEB-INF/jsp/sys/user/add.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收前台参数
		Map<String, String[]> map = request.getParameterMap();
		//返回信息
		Map<String,Object> mapData=new HashMap<>();
		//转换为bean
		User user=new User();
		try {
			BeanUtils.populate(user, map);
			//验证账号是否重复
			UserServices us=new UserServices();
			us.checkAccount(user.getAccount());
			//设置用户创建时间
			String user_create_time = DateUtil.getCurrentDate();
			user.setUser_create_time(user_create_time);
			us.addUser(user);
			//返回至前台
			mapData.put("msg", "添加成功!");
			mapData.put("flag", true);
		} catch (Exception e) {
			mapData.put("msg", e.getMessage());
			mapData.put("flag",false);
		}
		//转换为JSON
		JsonUtil.Print(response,mapData);
	
	
	
	
	}
	
	
}
