package com.wrf.shop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.common.CallCode;
import com.wrf.shop.sys.common.Code;

@WebServlet("/Fg")
public class Fg extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			CallCode.getCode(request, response, "17390089054");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
			
	}

}
