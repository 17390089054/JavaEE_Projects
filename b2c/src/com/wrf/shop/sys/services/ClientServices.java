package com.wrf.shop.sys.services;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.wrf.shop.sys.model.Client;
import com.wrf.shop.sys.util.DBUtil;

/**
 @ClassName ClientServices
 * @Description 客户Services
 * @Author invincible
 * @Date 2018年2月28日 上午11:58:32
 */
public class ClientServices {
	/**
	 * @Title: Login   
	 * @Description: TODO(登录主方法)   
	 * @param: @param c_account
	 * @param: @param c_password
	 * @param: @return
	 * @param: @throws Exception      
	 * @return: Client      
	 * @throws
	 */
	public  Client Login(String c_account,String c_password) throws Exception{
		Client client=new Client();
		String sql="select * from client where c_account=? and c_password=?";
		Map<String,Object>map=DBUtil.query(sql, new Object[]{
				c_account,
				c_password
		});
		if(map!=null&&map.size()>0){
			BeanUtils.populate(client, map);
		}else{
			throw new Exception("账号或密码错误!");
		}
		return client;
	}
	
	/**
	 * @Title: addClient   
	 * @Description: TODO(客户添加)   
	 * @param: @param client
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void addClient(Client client) throws Exception{
		String sql="insert into client (c_name,c_account,c_photo,c_password,c_create_time,c_sex,c_birthday,c_tel) values(?,?,?,?,?,?,?,?)";
		int num=DBUtil.executeUpdate(sql, new Object[]{
		client.getC_name(),
		client.getC_account(),
		"resource/img/a1.jpg",
		client.getC_password(),
		client.getC_create_time(),
		client.getC_sex(),
		client.getC_birthday(),
		client.getC_tel()
		});
		if(num<=0){
			throw new Exception("遇到未知错误!请联系管理员!");
		}
	}
	
	/**
	 * @Title: checkAccountNum   
	 * @Description: TODO(验证账号是否重复)   
	 * @param: @param c_account
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void checkAccountNum(String c_account) throws Exception{
		String sql="select count(*) as num from client where c_account=?";
		Map<String, Object> map = DBUtil.query(sql, c_account);
		if(map!=null&&map.size()>0){
			int num=Integer.parseInt(map.get("num").toString());
			if(num>0){
				throw new Exception("账号已存在!");
			}
		}
		
	}
	
	/**
	 * @Title: revisePassword   
	 * @Description: TODO(修改密码)   
	 * @param: @param c_tel
	 * @param: @param c_password
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void revisePassword(String c_account,String c_password) throws Exception{
		String sql="update client set c_password=? where c_account=?";
		int num=DBUtil.executeUpdate(sql, new Object[]{
				c_password.trim(),
				c_account.trim()
		});
		if(num<0){
			throw new Exception("遇到未知错误!请联系管理员");
		}
		
	}
	
	/**
	 * @Title: queryPassword   
	 * @Description: TODO(检验是否有此手机号)   
	 * @param: @param c_tel
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void queryPassword(String c_tel) throws Exception{
		String sql="select * from client where c_tel=?";
		Map<String, Object> map = DBUtil.query(sql, c_tel);
		if(map!=null&map.size()>0){
			System.out.println(map);
		}else{
			throw new Exception("暂无此手机号注册!");
		}
	}
	
	/**
	 * @Title: queryList   
	 * @Description: TODO(查询客户列表)   
	 * @param: @return      
	 * @return: List<Client>      
	 * @throws
	 */
	public List<Client> queryList(){
		List<Client>resultList=new ArrayList<>();
		String sql="select * from client";
		List<Map<String, Object>> list = DBUtil.list(sql);
		/*遍历列表*/
		for(Map<String,Object>map:list){
			Client client=new Client();
			try {
				BeanUtils.populate(client, map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			resultList.add(client);
		}
		
		return resultList;
	}
	
	/**
	 * @Title: Collect   
	 * @Description: TODO(收藏商品)   
	 * @param: @param g_id
	 * @param: @param c_id
	 * @param: @param date
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void Collect(int g_id,int c_id,String date) throws Exception{
		String sql="insert into collection (co_goods_id,co_client_id,co_create_time)values(?,?,?)";
		int num=DBUtil.executeUpdate(sql, new Object[]{g_id,c_id,date});
		if(num<0){
			throw new Exception("出现未知错误!请联系管理员!");
		}
		
	}
	
	/**
	 * @throws Exception 
	 * @Title: reviseClient   
	 * @Description: TODO(修改用户信息)   
	 * @param: @param client      
	 * @return: void      
	 * @throws
	 */
	public void reviseClient(Client client) throws Exception{
		String sql="update client set c_name=?,c_photo=?,c_tel=?,c_sex=?,c_birthday=? where c_id=?";
		int num=DBUtil.executeUpdate(sql, new Object[]{
			client.getC_name(),
			client.getC_photo(),
			client.getC_tel(),
			client.getC_sex(),
			client.getC_birthday(),
			client.getC_id()
		});
		if(num<0){
			throw new Exception("出现未知错误!请联系管理员!");
		}
		
	}
	
	/**
	 * @Title: queryClient   
	 * @Description: TODO(查询用户信息)   
	 * @param: @param c_id
	 * @param: @return      
	 * @return: Client      
	 * @throws
	 */
	public Client queryClient(int c_id){
		Client client=new Client();
		String sql="select * from client where c_id=?";
		Map<String, Object> query = DBUtil.query(sql,c_id);
		if(query!=null&&query.size()>0){
			try {
				BeanUtils.populate(client,query);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return client;
	}
	
	/**
	 * @Title: isExisted   
	 * @Description: TODO(检查账号是否存在)   
	 * @param: @param c_account
	 * @param: @return      
	 * @return: boolean      
	 * @throws
	 */
	public boolean isExisted(String c_account){
		String sql="select count(*) as num from client where c_account=?";
		Map<String, Object> map = DBUtil.query(sql, c_account);
		if(map!=null&&map.size()>0){
			int num = Integer.parseInt(map.get("num").toString());
			if(num>=1){
				return true;
			}else{
				return false;
			}
		}
	return true;
	}
	
	

}
