package com.wrf.shop.web.address;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.wrf.shop.sys.model.Address;
import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.services.AddressServices;
import com.wrf.shop.sys.util.Tools;
@WebServlet("/addressAdd.a")
public class AddressAdd extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询省份信息
		AddressServices as=new AddressServices();
		request.setAttribute("list", as.provinceList());
		request.getRequestDispatcher("WEB-INF/jsp/web/address/add.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> map = request.getParameterMap();
		//获取client_id
		HttpSession session = request.getSession();
		Client client=(Client)session.getAttribute("client");
		Integer c_id = client.getC_id();
		//转换为Address对象
		Address addr=new Address();
		addr.setA_client_id(c_id);
		try {
			BeanUtils.populate(addr, map);
			//插入数据
			AddressServices as=new AddressServices();
			as.addAddress(addr);
			Tools.message(response, "添加成功!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("WEB-INF/jsp/web/address/add.jsp").forward(request, response);
		}
		
		
		
	}

}
