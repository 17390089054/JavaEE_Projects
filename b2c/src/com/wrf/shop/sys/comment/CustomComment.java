package com.wrf.shop.sys.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.CommentServices;
@WebServlet("/commentList.do")
public class CustomComment extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询所有的评价信息
		CommentServices cs=new CommentServices();
		request.setAttribute("list", cs.selectList());;
		request.getRequestDispatcher("WEB-INF/jsp/sys/comment/list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
