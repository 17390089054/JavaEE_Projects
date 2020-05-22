package com.wrf.shop.sys.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
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
/**
 @ClassName Code
 * @Description 
 * @Author invincible
 * @Date 2018年3月29日 下午7:52:47
 */
public class Code {
	private static final String PATH= "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
	private static final String SID= "587610535b524fe9b2d0e96f67859def";
	private static final String TOKEN= "0e062e9de1814308828f004beb530f4d";
	
	public  static String getCode(HttpServletRequest req,HttpServletResponse resp,String telephone) throws Exception{
		//设置字符编码
				req.setCharacterEncoding("UTF-8");
				resp.setCharacterEncoding("UTF-8");		
				String random=getRandom();
				String timestamp=getTimestamp();
				String sig=getSig(SID,TOKEN,timestamp);
				String smsContent="【极光科技】您的验证码为"+random+"，请于2分钟内正确输入，如非本人操作，请忽略此短信。";
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
				
				//resp.getWriter().print(random);
				return random;
				
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