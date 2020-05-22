package com.wrf.shop.sys.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.UserServices;
import com.wrf.shop.sys.util.JsonUtil;

@WebServlet("/userRoleChange.do")
public class UserRoleChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取默认用户角色
		String role_id = request.getParameter("user_role_id");
		String user_id = request.getParameter("user_id");
		//查询角色信息
		UserServices us=new UserServices();
		List<Map<String, Object>> roleList = us.queryRole();
		if(role_id!=null&&user_id!=null){
			request.setAttribute("user_role_id", Integer.parseInt(role_id));
			request.setAttribute("user_id",Integer.parseInt(user_id));
		}
		request.setAttribute("list", roleList);
		request.getRequestDispatcher("WEB-INF/jsp/sys/user/changeRole.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//存储执行状态信息
		Map<String,Object>map=new HashMap<>();
		//获取前台信息
		String role_id = request.getParameter("role_id");
		String user_id=request.getParameter("user_id");
		//修改用户状态
		if(role_id!=null&&user_id!=null){
			UserServices us=new UserServices();
			try {
				us.changeUserRole(Integer.parseInt(role_id), Integer.parseInt(user_id));
				map.put("flag", true);
				map.put("msg", "修改成功");
			} catch (Exception e) {
				map.put("flag", false);
				map.put("msg", e.getMessage());
				e.printStackTrace();
			}
		}
		JsonUtil.Print(response, map);
		
	}

}
