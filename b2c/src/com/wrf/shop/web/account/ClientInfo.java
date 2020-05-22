package com.wrf.shop.web.account;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.services.ClientServices;
import com.wrf.shop.sys.util.JsonUtil;
import com.wrf.shop.sys.util.Tools;
import com.wrf.shop.sys.util.UploadUtil;
@WebServlet("/clientInfo.a")
public class ClientInfo extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取客户对象
		HttpSession session = request.getSession();
		Client client = (Client)session.getAttribute("client");
		//获取客户头像
		request.setAttribute("c_old_photo", client.getC_photo());
		Integer c_id = client.getC_id();
		ClientServices us=new ClientServices();
		request.setAttribute("c", us.queryClient(c_id));
		request.getRequestDispatcher("WEB-INF/jsp/web/account/info.jsp").forward(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//接收前台参数
		 Map<String, Object> map = UploadUtil.upload(request, "resource/img/photo/client");
		 String c_old_photo = map.get("c_old_photo").toString();
		//映射成ClientBean
		Client client=new Client();
		try {
			BeanUtils.populate(client,map);
			if(client.getC_photo()==null){
				client.setC_photo(c_old_photo);
			}
			ClientServices cs=new ClientServices();
			cs.reviseClient(client);
			Tools.message(response, "修改成功!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
