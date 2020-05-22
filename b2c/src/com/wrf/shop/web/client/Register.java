package com.wrf.shop.web.client;

import java.io.IOException;

import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.services.ClientServices;
import com.wrf.shop.sys.util.Tools;

@WebServlet("/register")
public class Register extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/jsp/web/client/register.jsp").forward(request, response);
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//获取前台参数
		Map<String, String[]> map = request.getParameterMap();
		Client client=new Client();
		try {
			//设置创建时间
			String date = Tools.getNow();
			client.setC_create_time(date);
			BeanUtils.populate(client, map);
			//验证账号是否重复
			ClientServices cs=new ClientServices();
			cs.checkAccountNum(client.getC_account());
			cs.addClient(client);
			Tools.messageBox(response, "注册成功!");
		} catch (Exception e) {
			request.setAttribute("client", client);
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("WEB-INF/jsp/web/client/register.jsp").forward(request, response);
		}
	}

}
