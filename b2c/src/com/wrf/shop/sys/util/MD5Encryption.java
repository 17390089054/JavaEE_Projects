package com.wrf.shop.sys.util;

/**
 @ClassName MD5Encryption
 * @Description 
 * @Author invincible
 * @Date 2018年5月6日 下午3:53:55
 */
public class MD5Encryption {
	/**
	 * 用户注册: 
	 *进行加密，页面传过来的不是明文，是一个哈希值，对哈希再加密
     * 之后存入数据库
     * 
     * 用户登录
     * 对用户登录传过来的哈希密码先进行加密
     * 加密后，与数据库存储的密码进行比对
     * 
     */ 
	//加密解密算法 执行一次加密，两次解密 
	public static String convertMD5(String inStr){  

    char[] a = inStr.toCharArray();  
    for (int i = 0; i < a.length; i++){  
        a[i] = (char) (a[i] ^ 't');  
    }  
    String s = new String(a);  
    return s;  
}

}
