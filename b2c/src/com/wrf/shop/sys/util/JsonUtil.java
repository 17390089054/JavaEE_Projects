package com.wrf.shop.sys.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;



/**
 @ClassName PrintUtil
 * @Description 
 * @Author invincible
 * @Date 2018年2月21日 下午6:16:00
 */
public class JsonUtil {
	/**
	 * @Title: JsonUtil   
	 * @Description: TODO(返回数据至前台(json))   
	 * @param: @param response
	 * @param: @param map
	 * @param: @throws IOException      
	 * @return: void      
	 * @throws
	 */
	public static void Print(HttpServletResponse response,Object object) throws IOException{
		//设置字符编码
		response.setContentType("text/html;charset=utf-8");
		Gson gson=new Gson();
		String result = gson.toJson(object);
		//打印结果
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}
	
}
