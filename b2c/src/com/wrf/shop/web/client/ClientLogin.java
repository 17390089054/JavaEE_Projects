package com.wrf.shop.web.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.model.ShopCar;
import com.wrf.shop.sys.services.ClientServices;
import com.wrf.shop.sys.services.GoodsServices;
import com.wrf.shop.sys.services.GoodsTypeServices;
import com.wrf.shop.sys.services.ShopCarServices;
import com.wrf.shop.sys.util.Tools;

@WebServlet("/clientLogin")
public class ClientLogin extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/jsp/web/client/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收前台参数
		String c_account=request.getParameter("c_account");
		String c_password=request.getParameter("c_password");
		//判断登录
		if(c_account!=null&&c_password!=null){
			try {
				ClientServices cs=new ClientServices();
				Client client=cs.Login(c_account, c_password);
				System.out.println(client);
				//查询用户购物车商品列表 商品总数量 商品订单总价 
				HttpSession session = request.getSession();
				ShopCarServices sc=new ShopCarServices();
				
				List<ShopCar> shopCarList = sc.shopCarList(client.getC_id());
				if(shopCarList!=null&&shopCarList.size()>0){					
					session.setAttribute("sum", sc.selectNum(client.getC_id()));
					session.setAttribute("totalPrice", sc.selectTotalPrice(client.getC_id()));
					session.setAttribute("carList",shopCarList);
					System.out.println(shopCarList);
				}
				session.setAttribute("client", client);
				//提示
				Tools.messageLogin(response, "登录成功!");
			} catch (Exception e) {
				//回显
				request.setAttribute("msg", e.getMessage());
				request.setAttribute("c_account", c_account);
				request.getRequestDispatcher("WEB-INF/jsp/web/client/login.jsp").forward(request, response);
			}
		}
		
	}

}
