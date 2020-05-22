package com.wrf.shop.sys.user;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.wrf.shop.sys.model.PageBean;
import com.wrf.shop.sys.model.User;
import com.wrf.shop.sys.services.UserServices;

@WebServlet("/userList.do")
public class UserList extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收前台参数
		Map<String, String[]> map = request.getParameterMap();
		//转换为Bean
		User user=new User();
		try {
			BeanUtils.populate(user, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//判断是否有PageNow信息
		PageBean pb=new PageBean();
		if(request.getParameter("pageNow")!=null){
			pb.setPageNow(Integer.parseInt(request.getParameter("pageNow")));
		}
		pb.setPageSize(6);
		//查询所有用户信息
		UserServices us=new UserServices();
		pb = us.queryUserList(user,pb);
		//查询所有角色信息
		List<Map<String, Object>> roleList = us.queryRole();
		request.setAttribute("roleList",roleList);
		request.setAttribute("pb", pb);
		request.setAttribute("user", user);
		request.getRequestDispatcher("WEB-INF/jsp/sys/user/list.jsp").forward(request, response);
	}

}
