package com.wrf.shop.web.comment;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.wrf.shop.sys.model.Comment;
import com.wrf.shop.sys.services.CommentServices;
import com.wrf.shop.sys.services.GoodsServices;
import com.wrf.shop.sys.util.JsonUtil;
import com.wrf.shop.sys.util.Tools;

@WebServlet("/addComment.a")
public class AddComment extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收前台参数
		String g_id = request.getParameter("g_id");
		String c_id = request.getParameter("c_id");
		String go_id = request.getParameter("go_id");
		//查询商品信息
		GoodsServices gs=new GoodsServices();
		request.setAttribute("go_id", go_id);
		request.setAttribute("c_id", c_id);
		request.setAttribute("goods", gs.queryGoods(Integer.parseInt(g_id)));
		request.getRequestDispatcher("WEB-INF/jsp/web/comment/add.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码
		request.setCharacterEncoding("utf-8");
		//接收前台参数
		Map<String, String[]> map = request.getParameterMap();
		String go_id = request.getParameter("go_id");
		//执行结果返回前台
		Map<String,Object>rmap=new HashMap<>();
		Comment comment=new Comment();
		if(map!=null&&map.size()>0){
			try {
				BeanUtils.populate(comment, map);
				//设置评论时间
				comment.setGc_create_time(Tools.getNow());
				CommentServices cs=new CommentServices();
				cs.addComment(comment,Integer.parseInt(go_id));
				rmap.put("flag",true);
				rmap.put("msg","评论成功!");
			} catch (Exception e) {
				rmap.put("flag",false);
				rmap.put("msg",e.getMessage());
				e.printStackTrace();
			}
		}
		JsonUtil.Print(response, rmap);
	}

}
