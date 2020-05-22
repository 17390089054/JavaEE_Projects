package com.wrf.shop.sys.services;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.wrf.shop.sys.model.Address;
import com.wrf.shop.sys.util.DBUtil;

/**
 @ClassName AddressServices
 * @Description 
 * @Author invincible
 * @Date 2018年3月9日 下午4:00:55
 */
public class AddressServices {
	
	/**
	 * @Title: provinceList   
	 * @Description: TODO(查询所有用户省份)   
	 * @param: @return      
	 * @return: List<Map<String,Object>>      
	 * @throws
	 */
	public List<Map<String,Object>> provinceList(){
		List<Map<String, Object>> proList =new ArrayList<>();
		String sql="select * from province";
		List<Map<String, Object>> list = DBUtil.list(sql);
		for(Map<String,Object>map:list){
			proList.add(map);
		}
		return proList;
	}
	
	/**
	 * @Title: cityList   
	 * @Description: TODO(查询城市列表)   
	 * @param: @param province_id
	 * @param: @return      
	 * @return: List<Map<String,Object>>      
	 * @throws
	 */
	public List<Map<String,Object>> cityList(int province_id){
		List<Map<String, Object>> cList =new ArrayList<>();
		String sql="select * from city where province_id=?";
		List<Map<String, Object>> list = DBUtil.list(sql,province_id);
		for(Map<String,Object>map:list){
			cList.add(map);
		}
		return cList;
	}
	
	/**
	 * @Title: areaList   
	 * @Description: TODO(查询区域信息)   
	 * @param: @param city_id
	 * @param: @return      
	 * @return: List<Map<String,Object>>      
	 * @throws
	 */
	public List<Map<String,Object>> areaList(int city_id){
		List<Map<String, Object>> aList =new ArrayList<>();
		String sql="select * from area where city_id=?";
		List<Map<String, Object>> list = DBUtil.list(sql,city_id);
		for(Map<String,Object>map:list){
			aList.add(map);
		}
		return aList;
	}
	
	/**
	 * @Title: addAddress   
	 * @Description: TODO(添加地址)   
	 * @param: @param address
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void addAddress(Address address) throws Exception{
		String sql="insert into address (a_province_id,a_city_id,a_area_id,a_client_id,a_desc,a_tel) values(?,?,?,?,?,?)";
		int num = DBUtil.executeUpdate(sql,new Object[]{
			 address.getA_province_id(),
			 address.getA_city_id(),
			 address.getA_area_id(),
			 address.getA_client_id(),
			 address.getA_desc(),
			 address.getA_tel()
		});
		if(num<0){
			throw new Exception("出现未知错误,请联系管理员");
		}
	}
	
	/**
	 * @Title: addrList   
	 * @Description: TODO(查询最新两条收货地址)   
	 * @param: @return      
	 * @return: List<Address>      
	 * @throws
	 */
	public List<Address>addrList(int c_id){
		List<Address>addrList=new ArrayList<>();
		String sql="select * from address as addr,client as c,province as pro,city as ct,area as a"
				+ " where addr.a_client_id=c.c_id and addr.a_province_id=pro.province_id "
				+ "and addr.a_city_id=ct.city_id and addr.a_area_id=a.area_id and c.c_id=? order by a_id desc limit 3";
		List<Map<String, Object>> list = DBUtil.list(sql,c_id);
		if(list!=null&&list.size()>0){
			for(Map<String,Object>map:list){
				Address addr=new Address();
				try {
					BeanUtils.populate(addr, map);
					addrList.add(addr);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return addrList;
	}
	
	/**
	 * @Title: queryAddress   
	 * @Description: TODO(查询单个地址信息)   
	 * @param: @param a_id
	 * @param: @return      
	 * @return: Address      
	 * @throws
	 */
	public   Address queryAddress(int a_id){
		String sql="select * from address a,client cl,province pro,city  c,area ar where a.a_client_id=cl.c_id and a.a_province_id =pro.province_id and a.a_city_id=c.city_id and a.a_area_id=ar.area_id and a.a_id=?";
		Map<String, Object> map = DBUtil.query(sql,a_id);
		Address address =new Address();
		if(map!=null&&map.size()>0){
			try {
				BeanUtils.populate(address, map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return address;
	}
	
	/**
	 * @Title: editAddress   
	 * @Description: TODO(修改地址)   
	 * @param: @param addr
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void editAddress(Address addr) throws Exception{
		String sql="update address set a_province_id=? , a_area_id=? ,a_city_id=? ,a_desc=?, a_tel=? where a_id=?";
		int num=DBUtil.executeUpdate(sql, new Object[]{
				addr.getA_province_id(),
				addr.getA_area_id(),
				addr.getA_city_id(),
				addr.getA_desc(),
				addr.getA_tel(),
				addr.getA_id()
		});
		if(num<0){
			throw new Exception("遇到未知错误!请联系管理员!");
		}
		
	}
	
	
	
	/**
	 * @Title: reviseStatus   
	 * @Description: TODO(设置默认收货地址)   
	 * @param: @param a_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void reviseStatus(int a_id) throws Exception{
		String sql="update address set a_status=1 where a_id=?";
		String sql2="update address set a_status=0 where a_id !=?";
		int num=DBUtil.executeUpdate(sql, a_id);
		int num2=DBUtil.executeUpdate(sql2, a_id);
		if(num<0||num2<0){
			throw new Exception("遇到未知错误!请联系管理员!");
		}
		
	}
	
	/**
	 * @Title: deleteAddress   
	 * @Description: TODO(删除收货地址)   
	 * @param: @param a_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void deleteAddress(int a_id) throws Exception{
		String sql="delete from address where a_id=?";
		int num=DBUtil.executeUpdate(sql,a_id);
		if(num<0){
			throw new Exception("遇到未知错误!请联系管理员!");
		}
		
	}
	
	
	
	
}
