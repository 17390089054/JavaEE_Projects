package com.wrf.shop.sys.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 @ClassName DateUtil
 * @Description 获取当前时间工具类
 * @Author invincible
 * @Date 2018年2月21日 下午5:46:48
 */
public class DateUtil {
	/**
	 * @Title: getCurrentDate   
	 * @Description: TODO(获取时间的方法)   
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	public static String  getCurrentDate(){
		Date date=new Date();
		SimpleDateFormat sf=new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
		String time = sf.format(date);
		return time;
	}
}
