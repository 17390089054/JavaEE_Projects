package com.wrf.shop.sys.services;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.wrf.shop.sys.model.ShopCar;
import com.wrf.shop.sys.util.DBUtil;

/**
 @ClassName ShopCarServices
 * @Description  商品购物车Services
 * @Author invincible
 * @Date 2018年3月23日 下午10:04:41
 */
public class ShopCarServices {
	/**
	 * @Title: addShopCar   
	 * @Description: TODO(购物车商品添加方法)   
	 * @param: @param sc
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void addShopCar(ShopCar sc) throws Exception{
		//判断是否商品是否已存在 是数量+1 否添加记录
		int count=goodsCount(sc.getSc_goods_id(),sc.getSc_client_id());
		int num=0;
		if(count>0){
			String sql="update shop_cart set sc_number=sc_number+1 ,sc_create_time=? where sc_goods_id=? and sc_client_id=?";
			num=DBUtil.executeUpdate(sql, new Object[]{
				sc.getSc_create_time(),
				sc.getSc_goods_id(),		
				sc.getSc_client_id()
			});
		}
		else{			
			String sql="insert into shop_cart (sc_goods_id,sc_client_id,sc_create_time) values(?,?,?)";
			num=DBUtil.executeUpdate(sql, new Object[]{
					sc.getSc_goods_id(),
					sc.getSc_client_id(),
					sc.getSc_create_time()
			});
		}
		if(num<0){
			throw new Exception("添加失败!请联系系统管理员!");
		}
	}
	
	/**
	 * @Title: goodsCount   
	 * @Description: TODO(查询购物车商品数)   
	 * @param: @param g_id
	 * @param: @return      
	 * @return: int      
	 * @throws
	 */
	public int goodsCount(int g_id,int c_id){
		int num =0;
		String sql="select count(*) as num from shop_cart where sc_goods_id=? and sc_client_id=?";
		Map<String, Object> map = DBUtil.query(sql,new Object[]{
				g_id,
				c_id
		});
		if(map!=null&&map.size()>0){
			num= Integer.parseInt(map.get("num").toString());
		}
		return num;
	}
	
	
	
	/**
	 * @Title: shopCarList   
	 * @Description: TODO(查询当前购物车列表)   
	 * @param: @param c_id
	 * @param: @return      
	 * @return: List<ShopCar>      
	 * @throws
	 */
	public List<ShopCar>shopCarList(int c_id){
		List<ShopCar>carList=new ArrayList<>();
		String sql="select * from shop_cart,goods where sc_goods_id =g_id and sc_client_id=? order by sc_create_time desc";
		List<Map<String, Object>> list = DBUtil.list(sql, c_id);
		if(list!=null&&list.size()>0){
			for(Map<String,Object>map:list){
				ShopCar sc=new ShopCar();
				try {
					BeanUtils.populate(sc, map);
					carList.add(sc);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return carList;
	}
	
	/**
	 * @Title: queryShopCar   
	 * @Description: TODO(根据商品ID查询结算商品)   
	 * @param: @param g_id
	 * @param: @return      
	 * @return: ShopCar      
	 * @throws
	 */
	public ShopCar queryShopCar(int g_id){
		String sql="select * from shop_cart,goods where sc_goods_id =g_id and sc_goods_id=?";
		Map<String, Object> map = DBUtil.query(sql, g_id);
		ShopCar sc=new ShopCar();
		if(map!=null&&map.size()>0){
			try {
				BeanUtils.populate(sc, map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sc;
	}
	
	
	
	
	/**
	 * @Title: selectNum   
	 * @Description: TODO(查询购物车商品总数)   
	 * @param: @return      
	 * @return: int      
	 * @throws
	 */
	public int selectNum(int c_id){
		int sum=0;
		String sql="select sum(shop_cart.sc_number) as num from shop_cart where sc_client_id=?";
		Map<String, Object> map = DBUtil.query(sql,c_id);
		if(map!=null&&map.size()>0){
			if(map.get("num")!=null){
				sum=Integer.parseInt(map.get("num").toString());
			}
			
		}
		return sum;
	}
	
	/**
	 * @Title: selectTotalPrice   
	 * @Description: TODO(查询购物车订单商品总价)   
	 * @param: @return      
	 * @return: double      
	 * @throws
	 */
	public double selectTotalPrice(int c_id){
		//购物车订单总价
		double totalPrice=0;
		String sql="select sum(shop_cart.sc_number * goods.g_price) as totalPrice from shop_cart,goods WHERE sc_goods_id=g_id and sc_client_id=?";
		Map<String, Object> map = DBUtil.query(sql,c_id);
		if(map!=null&&map.size()>0){
			if(map.get("totalPrice")!=null){
				totalPrice=Double.parseDouble(map.get("totalPrice").toString());
			}
		}
		return totalPrice;
	}
	
	/**
	 * @Title: ReviseNum   
	 * @Description: TODO(修改商品购买数量)   
	 * @param: @param num
	 * @param: @param sc_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void ReviseNum(int num,int sc_id) throws Exception{
		String sql="update shop_cart set sc_number=? where sc_id=?";
		int num2=DBUtil.executeUpdate(sql, new Object[]{
				num,
				sc_id
		});
		if(num2<0){
			throw new Exception("修改失败!请联系管理员!");
		}
	}
	
	/**
	 * @Title: deleteCarItem   
	 * @Description: TODO(删除购物车商品)   
	 * @param: @param sc_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void deleteCarItem(int sc_id) throws Exception{
		String sql="delete from shop_cart where sc_id=?";
		int num=DBUtil.executeUpdate(sql, sc_id);
		if(num<0){
			throw new Exception("删除失败!请联系管理员!");
		}
		
	}
	
	/**
	 * @Title: deleteCarItem   
	 * @Description: TODO(清空购物车)   
	 * @param: @param cList
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void deleteCarItem(List<Integer>cList) throws Exception{
		for(Integer i:cList){
			String sql="delete from shop_cart where sc_id=?";
			int num=DBUtil.executeUpdate(sql,i);
			if(num<0){
				throw new Exception("删除失败!请联系管理员!");
			}
		}
		
	}
	
	
	/*public static void main(String[] args) {
		System.out.println(shopCarList(1));
	}*/
	
}
