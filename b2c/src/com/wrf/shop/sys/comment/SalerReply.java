package com.wrf.shop.sys.comment;

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
import com.wrf.shop.sys.util.Tools;
@WebServlet("/reply.do")
public class SalerReply extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收前台参数
		String gc_id = request.getParameter("gc_id");
		request.setAttribute("gc_id", gc_id);
		request.getRequestDispatcher("WEB-INF/jsp/sys/comment/reply.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//接收前台参数
		String gc_id = request.getParameter("gc_id");
		String gc_reply = request.getParameter("gc_reply");
		//执行结果返回前台
		Map<String,Object>map=new HashMap<>();
		if(gc_id!=null&&gc_reply!=null)
		{
			CommentServices cs=new CommentServices();
			try {
				String now = Tools.getNow();
				cs.addReply(Integer.parseInt(gc_id),gc_reply,now);
				map.put("flag", true);
				map.put("msg", "回复成功!");
			} catch (Exception e) {
				map.put("flag", true);
				map.put("msg", "回复成功!");
				e.printStackTrace();
			}
		}
		JsonUtil.Print(response, map);
	}
}
