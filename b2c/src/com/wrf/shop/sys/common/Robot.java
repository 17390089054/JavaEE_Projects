package com.wrf.shop.sys.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** 
 * @package:        com.wrf.lx
 * @Description:  TODO(������һ�仰�����������������) 
 * @author        knight
 * @Date          2018��1��22�� ����8:38:43 
 */
@WebServlet("/Robot")
public class Robot extends HttpServlet {
	private static final String URL="http://www.tuling123.com/openapi/api";
	private static final String KEY="2c570281f3b145e7aff4c6aa02427e3d";
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//����ǰ̨���� ƴ����������
		//String text=req.getParameter("text");
		String text=req.getParameter("text");
		 text = new String (req.getParameter( "text" ).getBytes ( "utf-8" ),"GBK" );
		String queryUrl=URL+"?key="+KEY+"&info="+text;
		//System.out.println(queryUrl);
		//�������󲢷�������
		//�½�URL
		URL url=new URL(queryUrl);
		//��������
		URLConnection connection = url.openConnection();
		//��ȡIO��
		InputStream inputStream = connection.getInputStream();
		//����һ��StringBuilder�洢��ȡ���
		StringBuilder sb=new StringBuilder();
		//����һ��bufferedReader(���ֽ�)��ȡIO��
		BufferedReader reader=new BufferedReader(new InputStreamReader(inputStream,"utf-8"));
		
		//��ʼ��ȡIO��
		String temp="";
		while((temp=reader.readLine())!=null)
		{
			sb.append(temp);
		}
		
		//�ر�����
		reader.close();
		System.out.println(sb.toString());
		//���������ǰ̨
		resp.setContentType("text/html;charset=utf-8");
		resp.getWriter().println(sb.toString());
	
	}

}
