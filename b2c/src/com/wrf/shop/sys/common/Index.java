package com.wrf.shop.sys.common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.util.ChartUtil;

@WebServlet("/Index.do")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ChartUtil.getBarChart(request,"resource/chart");
		ChartUtil.PieChart(request, "resource/chart");
		request.getRequestDispatcher("WEB-INF/jsp/sys/index.jsp").forward(request, response);
	}


}
