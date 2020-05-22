package com.wrf.shop.web.comment;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wrf.shop.sys.services.CommentServices;
import com.wrf.shop.sys.util.JsonUtil;

@WebServlet("/deleteComment.a")
public class DeleteComment extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//接收前台参数
		String gc_id = request.getParameter("gc_id");
		//设置返回参数
		Map<String,Object>map=new HashMap<>();
		if(gc_id!=null){
			CommentServices cs=new CommentServices();
			try {
				cs.deleteComment(Integer.parseInt(gc_id));
				map.put("flag", true);
				map.put("msg","删除成功!");
			} catch (Exception e) {
				map.put("flag", false);
				map.put("msg",e.getMessage());
				e.printStackTrace();
			}
		}
		JsonUtil.Print(response,map);
		
	}

}
