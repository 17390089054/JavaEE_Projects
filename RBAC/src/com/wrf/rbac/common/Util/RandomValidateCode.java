package com.wrf.rbac.common.Util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RandomValidateCode {

	public static final String RANDOMCODEKEY = "randomcode_key";//放到session中的key
	private static Random random = new Random();
	private static String randString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";//随机产生的字符串

	private static int width = 80;//图片宽
	private static int height = 26;//图片高
	private static int lineSize = 40;//干扰线数量
	private static int stringNum = 4;//随机产生字符数量

	/**
	 * 生成随机图片
	 */
	public static void getRandcode(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		//BufferedImage类是具有缓冲区的Image类,Image类是用于描述图像信息的类
		BufferedImage image = new BufferedImage(RandomValidateCode.width,RandomValidateCode.height,BufferedImage.TYPE_INT_BGR);
		//产生Image对象的Graphics对象,改对象可以在图像上进行各种绘制操作
		Graphics g = image.getGraphics();
		g.fillRect(0, 0, RandomValidateCode.width, RandomValidateCode.height);
		g.setFont(new Font("Times New Roman",Font.ROMAN_BASELINE,18));
		g.setColor(RandomValidateCode.getRandColor(160, 200));
		//绘制干扰线
		for(int i=0;i<=RandomValidateCode.lineSize;i++){
			RandomValidateCode.drowLine(g);
		}
		//绘制随机字符
		String randomString = "";
		for(int i=1;i<=RandomValidateCode.stringNum;i++){
			randomString=RandomValidateCode.drowString(g,randomString,i);
		}
		session.removeAttribute(RandomValidateCode.RANDOMCODEKEY);
		session.setAttribute(RandomValidateCode.RANDOMCODEKEY, randomString);
		g.dispose();
		try {
			//将内存中的图片通过流动形式输出到客户端
			ImageIO.write(image, "JPEG", response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*
	 * 获得字体
	 */
	private static Font getFont(){
		return new Font("Fixedsys",Font.CENTER_BASELINE,18);
	}
	/*
	 * 获得颜色
	 */
	private static Color getRandColor(int fc,int bc){
		if(fc > 255) {
			fc = 255;
		}
		if(bc > 255) {
			bc = 255;
		}
		int r = fc + RandomValidateCode.random.nextInt(bc-fc-16);
		int g = fc + RandomValidateCode.random.nextInt(bc-fc-14);
		int b = fc + RandomValidateCode.random.nextInt(bc-fc-18);
		return new Color(r,g,b);
	}

	/*
	 * 绘制字符串
	 */
	private static String drowString(Graphics g,String randomString,int i){
		g.setFont(RandomValidateCode.getFont());
		g.setColor(new Color(RandomValidateCode.random.nextInt(101),RandomValidateCode.random.nextInt(111),RandomValidateCode.random.nextInt(121)));
		String rand = String.valueOf(RandomValidateCode.getRandomString(RandomValidateCode.random.nextInt(RandomValidateCode.randString.length())));
		randomString +=rand;
		g.translate(RandomValidateCode.random.nextInt(3), RandomValidateCode.random.nextInt(3));
		g.drawString(rand, 13*i, 16);
		return randomString;
	}
	/*
	 * 绘制干扰线
	 */
	private static void drowLine(Graphics g){
		int x = RandomValidateCode.random.nextInt(RandomValidateCode.width);
		int y = RandomValidateCode.random.nextInt(RandomValidateCode.height);
		int xl = RandomValidateCode.random.nextInt(13);
		int yl = RandomValidateCode.random.nextInt(15);
		g.drawLine(x, y, x+xl, y+yl);
	}
	/*
	 * 获取随机的字符
	 */
	public static String getRandomString(int num){
		return String.valueOf(RandomValidateCode.randString.charAt(num));
	}
}