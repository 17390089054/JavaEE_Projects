package com.wrf.shop.sys.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.UserServices;
import com.wrf.shop.sys.util.JsonUtil;


@WebServlet("/userChangeStatus.do")
public class UserChangeStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收前台参数
		String user_id = request.getParameter("user_id");
		String user_status = request.getParameter("user_status");
		//定义map存储执行状态
		Map<String,Object>map=new HashMap<>();
		if(user_id!=null&&user_status!=null){
			UserServices us=new UserServices();
			try {
				us.changeUserStatus(Integer.parseInt(user_id),Integer.parseInt(user_status));
				map.put("flag", true);
				map.put("msg","修改成功");
			}catch (Exception e) {
				map.put("flag", false);
				map.put("msg",e.getMessage());
			}
			JsonUtil.Print(response, map);
		}
	}

}
