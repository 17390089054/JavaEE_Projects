package com.wrf.shop.web.client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.services.ClientServices;
import com.wrf.shop.sys.util.Tools;

@WebServlet("/collect.a")
public class Collect extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收前台参数
		String g_id = request.getParameter("g_id");
		if(g_id!=null){
			HttpSession session = request.getSession();
			Client client= (Client)session.getAttribute("client");
			Integer c_id = client.getC_id();
			String date = Tools.getNow();
			ClientServices cs = new ClientServices();
			try {
				cs.Collect(Integer.parseInt(g_id), c_id, date);
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.write("<script src=\"resource/js/jquery.min.js?v=2.1.4\"></script>");
				out.write("<script type=\"text/javascript\" src=\"resource/layer/layer.js\"></script> ");
				out.write("<script type=\"text/javascript\">");
				out.write("top.layer.alert('收藏成功!',{icon:1},function(){"
						+ "top.layer.closeAll();"
						+"window.location.href='item?g_id="+g_id+"'"
						+ "});");
				out.write("</script>");
				out.flush();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
