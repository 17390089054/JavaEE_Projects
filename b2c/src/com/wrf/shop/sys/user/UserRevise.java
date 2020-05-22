package com.wrf.shop.sys.user;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.wrf.shop.sys.model.User;
import com.wrf.shop.sys.services.UserServices;
import com.wrf.shop.sys.util.Tools;
import com.wrf.shop.sys.util.UploadUtil;

@WebServlet("/UserRevise.do")
public class UserRevise extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user =(User) session.getAttribute("user");
		request.setAttribute("user", user);
		request.setAttribute("old_user_photo", user.getUser_photo());
		request.getRequestDispatcher("WEB-INF/jsp/sys/user/revise.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收参数
		Map<String, Object> map = UploadUtil.upload(request, "resource/img/photo/user");
		String old_user_photo=map.get("old_user_photo").toString();
		User user=new User();
		try {
			BeanUtils.populate(user, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(user.getUser_photo()==null){
			user.setUser_photo(old_user_photo);
		}
		UserServices us=new UserServices();
			try {
				us.reviseUser(user);
				Tools.message(response, "修改成功!请重新登录查看!");
			} catch (Exception e) {
				Tools.message(response, e.getMessage());
			}
	}

}
