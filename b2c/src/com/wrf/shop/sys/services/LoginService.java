package com.wrf.shop.sys.services;

import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.wrf.shop.sys.model.User;
import com.wrf.shop.sys.util.DBUtil;

/**
 @ClassName LoginService
 * @Description 登录验证类
 * @Author invincible
 * @Date 2018年2月13日 下午5:26:58
 */
public class LoginService {
	public static User Login(String account,String password) throws Exception{
		//创建user存放用户信息
		User user=new User();
		String sql="select * from role,user where user_role_id=role.role_id and account=? and password=?";
		Map<String, Object> map = DBUtil.query(sql, new Object[]{account,password});
		if(map!=null&&map.size()>0){
			if(map.get("user_status").toString().equals("0")){
				throw new Exception("账号不可用,请联系管理员");
			}else{
				if(map.get("user_role_id")!=null&&!map.get("user_role_id").toString().equals("0")){
					//获取信息
					try{						
						BeanUtils.populate(user, map);				
					}catch(Exception e){
						e.printStackTrace();
					}
					
					//user=new User(user_id, account, password, user_tel, user_name, user_email, user_photo, user_create_time, user_sex, user_status, user_role_id);
					
				}
				else
				{
					throw new Exception("尚未分配角色,请联系管理员");
				}
			}
		}else
		{
			throw new Exception("账号或密码错误");
		}
		return user;
	}
	
	
}
