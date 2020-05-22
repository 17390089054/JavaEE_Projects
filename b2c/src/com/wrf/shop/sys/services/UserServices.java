package com.wrf.shop.sys.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringEscapeUtils;

import com.wrf.shop.sys.model.PageBean;
import com.wrf.shop.sys.model.User;
import com.wrf.shop.sys.util.DBUtil;

/**
 @ClassName UserServices
 * @Description 用户操作类
 * @Author invincible
 * @Date 2018年2月14日 下午12:11:25
 */
public class UserServices {
	/*
	public List<User>list(){
		List<User> queryList=new ArrayList<>();
		String sql="select * from user,role where user.user_role_id=role.role_id ";
		List<Map<String, Object>> list = DBUtil.list(sql);
		//遍历列表 转换为User对象
		for(Map<String,Object>map:list){
			User user=new User();
			try {
				BeanUtils.populate(user, map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			queryList.add(user);
		}	
		
		return queryList;
	}*/
	
	
	/**
	 * 
	 * @Title: queryUserList   
	 * @Description: TODO(模糊查询用户列表)   
	 * @param: @param user
	 * @param: @return      
	 * @return: List<User>      
	 * @throws
	 */
	public PageBean queryUserList(User user,PageBean pb){
		if(pb.getPageNow()==0){
			pb.setPageNow(1);
		}
		//定义队列存储查询信息
		List<User>userList=new ArrayList<>();
		StringBuilder sb=new StringBuilder("select * from user,role where user.user_role_id=role.role_id ");
		//模糊查询开始
		if(user.getAccount()!=null&&user.getAccount().trim().length()!=0){
			sb.append(" and account like '%"+StringEscapeUtils.escapeSql(user.getAccount())+"%'");
		}
		if(user.getUser_name()!=null&&user.getUser_name().trim().length()!=0){
			sb.append(" and user_name like '%"+StringEscapeUtils.escapeSql(user.getUser_name())+"%'");
		}
		if(user.getUser_sex()!=null&&user.getUser_sex().trim().length()!=0){
			sb.append(" and user_sex like '%"+StringEscapeUtils.escapeSql(user.getUser_sex())+"%'");
		}
		if(user.getUser_role_id()!=null&&user.getUser_role_id()!=0){
			sb.append(" and user_role_id = "+user.getUser_role_id()+"");
		}
		if(user.getUser_create_time()!=null&&user.getUser_create_time().trim().length()!=0){
			sb.append(" and user_create_time like '%"+StringEscapeUtils.escapeSql(user.getUser_create_time())+"%'");
		}
		String sql=sb.toString()+" limit "+(pb.getPageNow()-1)*pb.getPageSize()+","+pb.getPageSize()+"";
		System.out.println(sql);
		//查询
		List<Map<String, Object>> list = DBUtil.list(sql);
		//遍历
		for(Map<String,Object>map:list){
			User userTemp=new User();
			try {
				BeanUtils.populate(userTemp, map);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			userList.add(userTemp);
		}
		//存入查询结果
		pb.setData(userList);
		//设置页面参数
		pb.setTotalCount(countUserList("select count(*) from ("+sb.toString()+")as t"));
		pb.setTotalPage();
		System.out.println(pb);
		return pb;
	}
	/**
	 * @Title: countUserList   
	 * @Description: TODO(查询记录总数)   
	 * @param: @return      
	 * @return: int      
	 * @throws
	 */
	public int countUserList(String sql){
		int count=0;
		Map<String, Object> map = DBUtil.query(sql);
		if(map!=null){
			count=Integer.parseInt(map.get("count(*)").toString());
		}
		
		return count;
	}
	
	
	/**
	 * @Title: queryRole   
	 * @Description: TODO(查询角色表所有信息)   
	 * @param: @return      
	 * @return: List<Map<String,Object>>      
	 * @throws
	 */
	public List<Map<String,Object>> queryRole(){
		String sql="select * from role ";
		List<Map<String, Object>> roleList = DBUtil.list(sql);
		return roleList;
	}
	
	/**
	 * @Title: checkAccount   
	 * @Description: TODO(验证账号是否重复)   
	 * @param: @param account
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	
	public void checkAccount(String account) throws Exception{
		String sql="select count(*) as num from user where account=?";
		Map<String, Object> map = DBUtil.query(sql,StringEscapeUtils.escapeSql(account) );
		if(map!=null){
			if(Integer.parseInt(map.get("num").toString())>0){
				throw new Exception("账号已存在!");
			}
		}
	}
	/**
	 * @Title: addUser   
	 * @Description: TODO(用户添加(管理员))   
	 * @param: @param user
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void addUser(User user) throws Exception{
		String sql="insert into user (account,password,user_name,user_sex,user_role_id,user_create_time) values(?,?,?,?,?,?)";
		int num=DBUtil.executeUpdate(sql, new Object[]{
			user.getAccount(),
			user.getPassword(),
			user.getUser_name(),
			user.getUser_sex(),
			user.getUser_role_id(),
			user.getUser_create_time()			
		});
		if(num<=0){
			throw new Exception("添加失败!请联系管理员!");
		}
	}
	
	/**
	 * @Title: changeUserStatus   
	 * @Description: TODO(修改用户状态)   
	 * @param: @param user_id
	 * @param: @param user_status
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void changeUserStatus(int user_id,int user_status) throws Exception{
		int status=0;//要修改的状态
		if(user_status==0){
			status=1;
		}
		String sql="update user set user_status=? where user_id=?";
		int num = DBUtil.executeUpdate(sql, new Object[]{status,user_id});
		if(num<0){
			throw new Exception("修改失败!请联系管理员!");
		}
		
	}
	
	/**
	 * @Title: changeUserRole   
	 * @Description: TODO(用户状态修改方法)   
	 * @param: @param role_id
	 * @param: @param user_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void changeUserRole(int role_id,int user_id) throws Exception{
		String sql="update user set user_role_id=? where user_id=?";
		int num = DBUtil.executeUpdate(sql, new Object[]{role_id,user_id});
		if(num<0){
			throw new Exception("修改失败!请联系管理员!");
		}
	}
	
	/**
	 * 
	 * @Title: queryUserResign   
	 * @Description: TODO(查询离职员工)   
	 * @param: @param user
	 * @param: @param pb
	 * @param: @return      
	 * @return: PageBean      
	 * @throws
	 */
	public PageBean queryUserResign(User user,PageBean pb){
		if(pb.getPageNow()==0){
			pb.setPageNow(1);
		}
		//定义队列存储查询信息
		List<User>userList=new ArrayList<>();
		StringBuilder sb=new StringBuilder("select * from user,role where user.user_role_id=role.role_id and user_status=0 ");
		//模糊查询开始
		if(user.getAccount()!=null&&user.getAccount().trim().length()!=0){
			sb.append(" and account like '%"+StringEscapeUtils.escapeSql(user.getAccount())+"%'");
		}
		if(user.getUser_name()!=null&&user.getUser_name().trim().length()!=0){
			sb.append(" and user_name like '%"+StringEscapeUtils.escapeSql(user.getUser_name())+"%'");
		}
		if(user.getUser_sex()!=null&&user.getUser_sex().trim().length()!=0){
			sb.append(" and user_sex like '%"+StringEscapeUtils.escapeSql(user.getUser_sex())+"%'");
		}
		if(user.getUser_role_id()!=null&&user.getUser_role_id()!=0){
			sb.append(" and user_role_id = "+user.getUser_role_id()+"");
		}
		if(user.getUser_create_time()!=null&&user.getUser_create_time().trim().length()!=0){
			sb.append(" and user_create_time like '%"+StringEscapeUtils.escapeSql(user.getUser_create_time())+"%'");
		}
		String sql=sb.toString()+" limit "+(pb.getPageNow()-1)*pb.getPageSize()+","+pb.getPageSize()+"";
		System.out.println(sql);
		//查询
		List<Map<String, Object>> list = DBUtil.list(sql);
		//遍历
		for(Map<String,Object>map:list){
			User userTemp=new User();
			try {
				BeanUtils.populate(userTemp, map);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			userList.add(userTemp);
		}
		//存入查询结果
		pb.setData(userList);
		//设置页面参数
		pb.setTotalCount(countUserList("select count(*) from ("+sb.toString()+")as t"));
		pb.setTotalPage();
		System.out.println(pb);
		return pb;
	}
	
	/**
	 * @Title: reviseUser   
	 * @Description: TODO(修改用户资料)   
	 * @param: @param user
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void reviseUser(User user) throws Exception{
		String sql="update user set user_tel=?,user_email=?,user_name=?,user_photo=? where user_id=?";
		int num=DBUtil.executeUpdate(sql, new Object[]{user.getUser_tel(),user.getUser_email(),user.getUser_name(),user.getUser_photo(),user.getUser_id()});
		if(num<0){
			throw new Exception("遇到未知错误!请联系管理员!");
		}
		
	}
	
	
}
