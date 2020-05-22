package com.wrf.shop.web.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.services.CommentServices;
@WebServlet("/commentList.a")
public class CommentList extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询当前用户的评价信息
		CommentServices cs=new CommentServices();
		HttpSession session = request.getSession();
		Client client=(Client)session.getAttribute("client");
		Integer c_id = client.getC_id();
		request.setAttribute("list", cs.selectList(c_id));;
		request.getRequestDispatcher("WEB-INF/jsp/web/comment/list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
