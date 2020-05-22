package com.wrf.shop.web.address;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import com.wrf.shop.sys.model.Address;
import com.wrf.shop.sys.services.AddressServices;
import com.wrf.shop.sys.util.Tools;

@WebServlet("/addressEdit.a")
public class EditAddress extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String a_id = request.getParameter("a_id");
		if(a_id!=null){
			AddressServices as=new AddressServices();
			request.setAttribute("addr", as.queryAddress(Integer.parseInt(a_id)));
			request.setAttribute("list", as.provinceList());
			request.getRequestDispatcher("WEB-INF/jsp/web/address/edit.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//接收前台参数
		Map<String, String[]> map = request.getParameterMap();
		if(map!=null&&map.size()>0){
			Address addr=new Address();
			try {
				BeanUtils.populate(addr, map);
				AddressServices as=new AddressServices();
				as.editAddress(addr);
				Tools.message(response, "修改成功!");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", e.getMessage());
				request.getRequestDispatcher("WEB-INF/jsp/web/address/edit.jsp").forward(request, response);
			}
		}
		
		
	}

}
