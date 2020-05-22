package com.wrf.shop.sys.util;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 @ClassName RandomUtil
 * @Description 
 * @Author invincible
 * @Date 2018年3月9日 下午11:34:59
 */
public class RandomUtil extends Thread {

	private static int orderNum = 1;
	private static String format="";
	public static void main(String[] args) {
		System.out.println(getOrderNo());
		
	}
	
	
	
	public static String getOrderNo(){
		String No ="";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String nowdate = sdf.format(new Date());
		No+=getNo();
		return getUserId()+nowdate+No;
	}
	public static String getNo(){//返回当天的订单数+1
		//new RandomUtil().start();
		orderNum++;
		DecimalFormat df=new DecimalFormat("0000");
		 format = df.format(orderNum);
		return format;
	}
	
	public static String getUserId(){
		return "123";
	}
	
	
	public static String RandomStringId(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}
	/*@Override
	public void run() {
			orderNum++;
			DecimalFormat df=new DecimalFormat("0000");
			 format = df.format(orderNum);
			try {
					Thread.sleep(1000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	*/

}