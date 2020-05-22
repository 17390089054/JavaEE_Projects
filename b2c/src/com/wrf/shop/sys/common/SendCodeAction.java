package com.wrf.shop.sys.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/***
 * 发送验证码请求类
 * @author knight
 *
 */
//接受前台传过来的参数(手机号)
		/***
		 * 1.继承HttpServlet
		 * 2.声明当前类的访问路径(url-pattern)
		 * 3.实现请求的方式
		 */
@WebServlet("/sendCode")
public class SendCodeAction extends HttpServlet{
	private static final String PATH= "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
	private static final String SID= "71a2e15dbc434f9b86f3f47179aa0b35";
	private static final String TOKEN= "6c8d542c025247c5ae08490cc5092835";
/*	private static final String HEAD= "Content-type:application/x-www-form-urlencoded";*/

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//设置字符编码
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");		
		//获取手机号
		String telephone=req.getParameter("phone");		
		
		String random=getRandom();
		String timestamp=getTimestamp();
		String sig=getSig(SID,TOKEN,timestamp);
		String smsContent="【荣福科技】您的验证码为"+random+"，请于2分钟内正确输入，如非本人操作，请忽略此短信((福哥用心创造)。";
		//利用网络请求实现的方式
		String args="accountSid="+SID+"&smsContent="+smsContent+"&to="+telephone+"&timestamp="+timestamp+"&sig="+sig+"&respDataType=JSON";		
		//利用JAVA的网络编程实现短信发送
		URL url=new URL(PATH);
		HttpURLConnection connection=(HttpURLConnection) url.openConnection();
		connection.setRequestMethod("POST");
		connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
		connection.setDoInput(true);
		connection.setDoOutput(true);
		//提交数据
		OutputStreamWriter out=new OutputStreamWriter(connection.getOutputStream(),"UTF-8");
		out.write(args);
		out.flush();
		//System.out.println(args);
		//读取网络返回的参数
		
		BufferedReader in=new BufferedReader(new InputStreamReader(connection.getInputStream(),"UTF-8"));
	
		StringBuilder rd=new StringBuilder();
		String temp="";
		while((temp=in.readLine())!=null)
		{
			rd.append(temp);
			
			//System.out.println(temp);
		}
		
		if(in!=null)
		{
			in.close();
			
		}
		if(out!=null)
		{
			out.close();
		}
		System.out.println(rd.toString());
		
		resp.getWriter().print(random);
		
		
	}
	
	
	
	
	/***
	 * 获取时间戳
	 * @return
	 */
	private static String getTimestamp()
	{
		Date date=new Date();
		SimpleDateFormat sm=new SimpleDateFormat("yyyyMMddHHmmss");
		String format=sm.format(date);
		return format;
		
	}
	
	/**
	 * 生成随机验证码
	 * @return
	 */
	private static String getRandom()
	{
		
		String randNum=new Random().nextInt(1000000)+"";
		if(randNum.length()!=6)
		{
			return getRandom();
			
		}
		return randNum;
		
		
	}
	/**
	 * 生成数字签名(MD5加密)
	 * @param strings
	 * @return
	 */
	
	
	private static String getSig(String...strings){
		StringBuilder sb=new StringBuilder();
		if(strings.length==0||strings==null)
		return "";
		else
		{
			String temp="";
			for(String string:strings)
			{
				temp+=string;
				
			}
			try
			{
				MessageDigest digest=MessageDigest.getInstance("MD5");
				byte[] bytes=temp.getBytes();
				byte[] digest2=digest.digest(bytes);
				for(byte b:digest2)
				{
					String hex=Integer.toHexString(b&0xff);
					if(hex.length()==1)
					{
						sb.append("0"+hex);
					}
					else
					{
						sb.append(hex);
					}
				}
				
			}catch(Exception e)
			{
			e.getMessage();	
			
			e.printStackTrace();
			}
			
		}
		
		return sb.toString();
	}
	
	
	
}
