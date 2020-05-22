package com.wrf.shop.sys.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrf.shop.sys.model.User;

/**
 * 
 * @Title: message   
 * @Description: TODO(工具类)   
 * @param: @param response
 * @param: @param msg
 * @param: @throws IOException      
 * @return: void      
 * @throws
 */
public class Tools {
	
	/**
	 * @Title: message   
	 * @Description: TODO(信息提示方法)   
	 * @param: @param response
	 * @param: @param msg
	 * @param: @throws IOException      
	 * @return: void      
	 * @throws
	 */
	public static void message(HttpServletResponse response,  String msg) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write("<script src=\"resource/js/jquery.min.js?v=2.1.4\"></script>");
		out.write("<script type=\"text/javascript\" src=\"resource/layer/layer.js\"></script> ");
		out.write("<script type=\"text/javascript\">");
		out.write("top.layer.alert('"+msg+"',{icon:1,time:1000},function(){"
				+ "top.layer.closeAll();"
				+ "window.parent.location.reload();"
				+ "});");
		out.write("</script>");
		out.flush();
		out.close();
	}
	
	
	public static void messageLogin(HttpServletResponse response,  String msg) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write("<script src=\"resource/js/jquery.min.js?v=2.1.4\"></script>");
		out.write("<script type=\"text/javascript\" src=\"resource/layer/layer.js\"></script> ");
		out.write("<script type=\"text/javascript\">");
		out.write("top.layer.alert('"+msg+"',{icon:1,end:function(){"
				+ "top.layer.closeAll();"
				+ "window.location.href='Index'"
				+ "}});");
		out.write("</script>");
		out.flush();
		out.close();
	}
	
	
	/**
	 * @Title: login   
	 * @Description: TODO(登录主方法)   
	 * @param: @param response
	 * @param: @throws IOException      
	 * @return: void      
	 * @throws
	 */
	public static void login(HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write("<script src=\"resource/js/jquery.min.js\"></script>");
		out.write("<script type=\"text/javascript\" src=\"resource/layer/layer.js\"></script> ");
		out.write("<script type=\"text/javascript\">");
		out.write("layer.open({type: 2,"
				+ "title: '登录',"
				+ "shadeClose: true,"
				+ "shade: 0.4,"
				+ "area: ['440px','420px'],"
				+ "content: 'clientLogin',"
				+ "end:function(){window.location.reload()}}); ");
		out.write("</script>");
		/*self.location=document.referrer;*/
		out.flush();
		out.close();
	}
	
	
	/**
	 * 
	 * @Title: addressAdd   
	 * @Description: TODO(地址添加)   
	 * @param: @param response
	 * @param: @throws IOException      
	 * @return: void      
	 * @throws
	 */
	public static void userChange(HttpServletResponse response,String msg) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write("<script src=\"resource/js/jquery.min.js?v=2.1.4\"></script>");
		out.write("<script type=\"text/javascript\" src=\"resource/layer/layer.js\"></script> ");
		out.write("<script type=\"text/javascript\">");
		out.write("top.layer.alert('"+msg+"',{icon:1,time:1000,end:function(){"
				+ "top.layer.closeAll();"
				+ "window.parent.location.reload();"
				+ "}});");
		out.write("</script>");
		out.flush();
		out.close();
	}
	
	
	/**
	 * @Title: messageBox   
	 * @Description: TODO(客户基本操作)   
	 * @param: @param response
	 * @param: @param msg
	 * @param: @throws IOException      
	 * @return: void      
	 * @throws
	 */
	public static void messageBox(HttpServletResponse response,  String msg) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write("<script src=\"resource/js/jquery.min.js?v=2.1.4\"></script>");
		out.write("<script type=\"text/javascript\" src=\"resource/layer/layer.js\"></script> ");
		out.write("<script type=\"text/javascript\">");
		out.write("top.layer.alert('"+msg+"',{icon:1},function(){"
				+ "top.layer.closeAll();"
				+ "window.location.href='Index'});");
		out.write("</script>");
		
		out.flush();
		out.close();
	}
	
	
	/**
	 * @Title: getNow   
	 * @Description: TODO(获取时间方法)   
	 * @param: @param format
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	public static String getNow(String format) {
		Date date = new Date();
		SimpleDateFormat s = new SimpleDateFormat(format);
		return s.format(date);
	}

	public static String getNow() {
		Date date = new Date();
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return s.format(date);
	}
	
	/**
	 * @Title: getSessionUser   
	 * @Description: TODO(获取用户信息)   
	 * @param: @param request
	 * @param: @return      
	 * @return: User      
	 * @throws
	 */
	public static User getSessionUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session_user");
		return user;
	}
	
	
	
}
