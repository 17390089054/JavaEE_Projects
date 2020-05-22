package com.wrf.shop.sys.goodsSale;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.util.ChartUtil;
@WebServlet("/salement.do")
public class Salement extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//生成图表
		request.getRequestDispatcher("WEB-INF/jsp/sys/goodsSale/salement.jsp").forward(request, response);
	}

}
