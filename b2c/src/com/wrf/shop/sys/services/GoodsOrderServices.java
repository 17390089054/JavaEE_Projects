package com.wrf.shop.sys.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.commons.beanutils.BeanUtils;
import com.wrf.shop.sys.model.GoodsOrder;
import com.wrf.shop.sys.util.DBUtil;

/**
 @ClassName GoodsOrderServices
 * @Description 
 * @Author invincible
 * @Date 2018年3月9日 下午11:47:27
 */
public class GoodsOrderServices {
	/**
	 * @Title: addGoodsOrder   
	 * @Description: TODO(这里用一句话描述这个方法的作用)   
	 * @param: @param go
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void addGoodsOrder(GoodsOrder go,int number) throws Exception{
		String sql="";
		int num=0;
		if(number==1){
			sql="insert into goods_order (go_code,go_client_id,go_address_id,go_goods_id,go_create_time,go_money)values(?,?,?,?,?,?)";
			num=DBUtil.executeUpdate(sql,new Object[]{
					go.getGo_code(),
					go.getGo_client_id(),
					go.getGo_address_id(),
					go.getGo_goods_id(),
					go.getGo_create_time(),
					go.getGo_money()
			});
		}
		if(number==2){
			sql="insert into goods_order (go_code,go_client_id,go_address_id,go_goods_id,go_create_time,go_money,go_status)values(?,?,?,?,?,?,?)";
			num=DBUtil.executeUpdate(sql,new Object[]{
					go.getGo_code(),
					go.getGo_client_id(),
					go.getGo_address_id(),
					go.getGo_goods_id(),
					go.getGo_create_time(),
					go.getGo_money(),
					2
			});
		}
		
		if(num<0){
			throw new Exception("出现未知错误!请联系管理员!");
		}
	}
	
	/**
	 * @Title: addGoodsOrder   
	 * @Description: TODO(批量添加订单)   
	 * @param: @param orderList
	 * @param: @param number
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void addGoodsOrder(List<GoodsOrder> orderList,int number) throws Exception{
		String sql="";
		int num=0;
		if(number==1){
			for(int i=0;i<orderList.size();i++){				
				sql="insert into goods_order (go_code,go_client_id,go_address_id,go_goods_id,go_create_time,go_money)values(?,?,?,?,?,?)";
				num=DBUtil.executeUpdate(sql,new Object[]{
						orderList.get(i).getGo_code(),
						orderList.get(i).getGo_client_id(),
						orderList.get(i).getGo_address_id(),
						orderList.get(i).getGo_goods_id(),
						orderList.get(i).getGo_create_time(),
						orderList.get(i).getGo_money()
				});
			}
		}
		if(number==2){
			for(int i=0;i<orderList.size();i++){
				sql="insert into goods_order (go_code,go_client_id,go_address_id,go_goods_id,go_create_time,go_money,go_status)values(?,?,?,?,?,?,?)";
				num=DBUtil.executeUpdate(sql,new Object[]{
						orderList.get(i).getGo_code(),
						orderList.get(i).getGo_client_id(),
						orderList.get(i).getGo_address_id(),
						orderList.get(i).getGo_goods_id(),
						orderList.get(i).getGo_create_time(),
						orderList.get(i).getGo_money(),
						2
				});
			}
		}
		
		if(num<0){
			throw new Exception("出现未知错误!请联系管理员!");
		}
	}
	
	
	/**
	 * @Title: selectGoodsOrder   
	 * @Description: TODO(查询所有订单)   
	 * @param: @return      
	 * @return: List<GoodsOrder>      
	 * @throws
	 */
	public  List<GoodsOrder> selectGoodsOrder(){
		List<GoodsOrder>rList=new ArrayList<>();
		String sql="select * from goods_order as go ,goods as g ,client as c,address as a,province as pro,city as ct,area as ar where go.go_goods_id=g.g_id and go.go_client_id=c.c_id and go.go_address_id=a.a_id and a.a_province_id=pro.province_id and a.a_city_id=ct.city_id and a.a_area_id=ar.area_id order by go.go_id desc";
		List<Map<String, Object>> list = DBUtil.list(sql);
		if(list!=null){
			for(Map<String,Object>map:list){
				GoodsOrder go=new GoodsOrder();
				try {
					BeanUtils.populate(go, map);
					rList.add(go);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return rList;	
	}
	
	
	public  List<GoodsOrder> selectGoodsOrder(int c_id){
		List<GoodsOrder>rList=new ArrayList<>();
		String sql="select * from goods_order as go ,goods as g ,client as c,address as a,province as pro,city as ct,area as ar where go.go_goods_id=g.g_id and go.go_client_id=c.c_id and go.go_address_id=a.a_id and a.a_province_id=pro.province_id and a.a_city_id=ct.city_id and a.a_area_id=ar.area_id and c.c_id=? order by go.go_id desc";
		List<Map<String, Object>> list = DBUtil.list(sql,c_id);
		if(list!=null){
			for(Map<String,Object>map:list){
				GoodsOrder go=new GoodsOrder();
				try {
					BeanUtils.populate(go, map);
					rList.add(go);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return rList;	
	}
	
	/**
	 * @Title: reviseStatus   
	 * @Description: TODO(商家发货 修改商品状态)   
	 * @param: @param go_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void reviseStatus(int go_id) throws Exception{
		String sql="update goods_order set go_status=3 where go_id=?";
		int num = DBUtil.executeUpdate(sql,go_id);
		if(num<0){
			throw new Exception("遇到未知错误!请联系管理员!");
		}
		
	}
	
	/**
	 * @Title: reviseStatus   
	 * @Description: TODO(支付订单完成)   
	 * @param: @param go_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void reviseStatus(String go_id) throws Exception{
		String sql="update goods_order set go_status=2 where go_id=?";
		int num = DBUtil.executeUpdate(sql,go_id);
		if(num<0){
			throw new Exception("遇到未知错误!请联系管理员!");
		}	
	}
	
	
	
	/**
	 * @Title: reviseStatus   
	 * @Description: TODO(确认收货)   
	 * @param: @param go_id
	 * @param: @param go_status
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	
	public void reviseStatus(int go_id,int go_status,String f_date) throws Exception{
		String sql="update goods_order set go_status=? ,go_finish_time=? where go_id=?";
		int num=DBUtil.executeUpdate(sql, new Object[]{
			go_status,
			f_date,
			go_id
		});
		if(num<0){
			throw new Exception("遇到未知错误!请联系管理员！");
		}
	}
	
	
	/**
	 * @Title: deleteOrder   
	 * @Description: TODO(删除未支付的订单)   
	 * @param: @param go_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void deleteOrder(int go_id) throws Exception{
		String sql="delete from goods_order where go_id=?";
		int num = DBUtil.executeUpdate(sql, go_id);
		if(num<0){
			throw new Exception("遇到未知错误!请联系管理员!");
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
