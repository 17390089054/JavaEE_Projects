package com.wrf.shop.sys.services;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.wrf.shop.sys.model.GoodsType;
import com.wrf.shop.sys.util.DBUtil;

/**
 @ClassName GoodsTypeServices
 * @Description 商品类别管理类
 * @Author invincible
 * @Date 2018年2月24日 上午9:40:44
 */
public class GoodsTypeServices {
	
	/**
	 * @Title: selectClothes   
	 * @Description: TODO(查询服饰列表)   
	 * @param: @return      
	 * @return: List<GoodsType>      
	 * @throws
	 */
	public List<GoodsType>selectClothes(){
		//服饰子类别列表
		List<GoodsType>cList=new ArrayList<>();
		String sql="select * from goods_type where gt_parent_id=33";
		List<Map<String, Object>> list = DBUtil.list(sql);
		if(list!=null&&list.size()>0){
			for(Map<String,Object>map:list){
				GoodsType gt=new GoodsType();
				try {
					BeanUtils.populate(gt, map);
					cList.add(gt);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return cList;
	}
	
	/**
	 * @Title: selectAppliance   
	 * @Description: TODO(查询电器子商品列表)   
	 * @param: @return      
	 * @return: List<GoodsType>      
	 * @throws
	 */
	public List<GoodsType>selectAppliance(){
		//电器子类别列表
		List<GoodsType>cList=new ArrayList<>();
		String sql="select * from goods_type where gt_parent_id=1";
		List<Map<String, Object>> list = DBUtil.list(sql);
		if(list!=null&&list.size()>0){
			for(Map<String,Object>map:list){
				GoodsType gt=new GoodsType();
				try {
					BeanUtils.populate(gt, map);
					cList.add(gt);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return cList;
	}
	
	/**
	 * @Title: selectFood   
	 * @Description: TODO(查询食品列表)   
	 * @param: @return      
	 * @return: List<GoodsType>      
	 * @throws
	 */
	public List<GoodsType>selectFood(){
		//食品子类别列表
		List<GoodsType>cList=new ArrayList<>();
		String sql="select * from goods_type where gt_parent_id=9";
		List<Map<String, Object>> list = DBUtil.list(sql);
		if(list!=null&&list.size()>0){
			for(Map<String,Object>map:list){
				GoodsType gt=new GoodsType();
				try {
					BeanUtils.populate(gt, map);
					cList.add(gt);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return cList;
	}
	
	/**
	 * @Title: selectFood   
	 * @Description: TODO(查询生活用品列表)   
	 * @param: @return      
	 * @return: List<GoodsType>      
	 * @throws
	 */
	public List<GoodsType>selectDailyGoods(){
		//生活用品子类别列表
		List<GoodsType>cList=new ArrayList<>();
		String sql="select * from goods_type where gt_parent_id=10";
		List<Map<String, Object>> list = DBUtil.list(sql);
		if(list!=null&&list.size()>0){
			for(Map<String,Object>map:list){
				GoodsType gt=new GoodsType();
				try {
					BeanUtils.populate(gt, map);
					cList.add(gt);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return cList;
	}
	
	
	/**
	 * @Title: selectParent   
	 * @Description: TODO(查询父类商品)   
	 * @param: @return      
	 * @return: List<GoodsType>      
	 * @throws
	 */
	public List<GoodsType>selectParent(){
		List<GoodsType>queryList=new ArrayList<>();
		String sql="select * from goods_type where gt_parent_id is null";
		List<Map<String, Object>> list = DBUtil.list(sql);
		//转换map为Bean
		for(Map<String,Object>map:list){
			GoodsType goodsType=new GoodsType();
			try {
				BeanUtils.populate(goodsType, map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			queryList.add(goodsType);
		}
		return queryList;
	}

	/**
	 * @Title: selectChildren   
	 * @Description: TODO(查询所有子类商品)   
	 * @param: @return      
	 * @return: List<GoodsType>      
	 * @throws
	 */
	public List<GoodsType>selectChildren(){
		List<GoodsType>queryList=new ArrayList<>();
		String sql="select * from goods_type where gt_parent_id is not null";
		List<Map<String, Object>> list = DBUtil.list(sql);
		//转换map为Bean
		for(Map<String,Object>map:list){
			GoodsType goodsType=new GoodsType();
			try {
				BeanUtils.populate(goodsType, map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			queryList.add(goodsType);
		}
		return queryList;
	}
	
	/**
	 * @Title: addParent   
	 * @Description: TODO(添加父类商品)   
	 * @param: @param gt_name
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void addParent(String gt_name) throws Exception{
		String sql="insert into goods_type (gt_name) values (?)";
		int num=DBUtil.executeUpdate(sql, gt_name);
		if(num<=0){
			throw new Exception("添加失败!请联系管理员!");
		}
	}
	
	/**
	 * @Title: checkGoodsNum   
	 * @Description: TODO(检查商品名称是否重复)   
	 * @param: @param gt_name
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	
	public void checkGoodsNum(String gt_name) throws Exception{
		String sql="select count(*) as num from goods_type where gt_name=?";
		Map<String, Object> map = DBUtil.query(sql, gt_name);
		if(map!=null){
			if(Integer.parseInt(map.get("num").toString())>0){
				throw new Exception("商品名称已存在");
			}
		}

	}
	
	
	/**
	 * @Title: queryGoodsType   
	 * @Description: TODO(查询父类商品信息)   
	 * @param: @param gt_id
	 * @param: @return      
	 * @return: GoodsType      
	 * @throws
	 */
	public GoodsType queryGoodsType(int gt_id){
		//商品类型
		GoodsType goodsType =new GoodsType();
		String sql="select * from goods_type where gt_id=?";
		Map<String, Object> map = DBUtil.query(sql, gt_id);
		if(map!=null){
			try {
				BeanUtils.populate(goodsType,map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return goodsType;
		
	}
	
	/**
	 * @Title: addChild   
	 * @Description: TODO(添加子商品信息)   
	 * @param: @param gt_name
	 * @param: @param gt_parent_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void addChild(String gt_name,int gt_parent_id) throws Exception{
		String sql="insert into goods_type (gt_name,gt_parent_id)values(?,?)";
		int num=DBUtil.executeUpdate(sql, new Object[]{gt_name,gt_parent_id});
		if(num<=0){
			throw new Exception("添加失败!请联系管理员!");
		}
		
		
		
		
		
		
	}

	/**
	 * @throws Exception 
	 * @Title: reviseGoodsTypeName   
	 * @Description: TODO(修改商品类别名称)   
	 * @param: @param gt_name
	 * @param: @param parseInt      
	 * @return: void      
	 * @throws  
	 */
	public void reviseGoodsTypeName(String gt_name, int gt_id) throws Exception {
		String sql="update goods_type set gt_name=? where gt_id=? ";
		int num=DBUtil.executeUpdate(sql, new Object[]{gt_name,gt_id});
		if(num<0){
			throw new Exception("修改失败,请联系管理员");
		}
	
	}
	
	/**
	 * @Title: queryParentGoodsTypeCount   
	 * @Description: TODO(查询父类关联子类商品数)   
	 * @param: @param gt_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void queryParentGoodsTypeCount(int gt_id) throws Exception{
		String sql="select count(*) as num from goods_type where gt_parent_id=?";
		Map<String, Object> map = DBUtil.query(sql, gt_id);
		if(map!=null){
			if(Integer.parseInt(map.get("num").toString())>0){
				throw new Exception("该商品下尚有商品,不得删除!");
			}
		}
		
	}
	
	/**
	 * 
	 * @Title: deleteGoodsType   
	 * @Description: TODO(删除商品信息)   
	 * @param: @param gt_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void deleteGoodsType(int gt_id) throws Exception{
		String sql="delete from goods_type where gt_id=?";
		int num = DBUtil.executeUpdate(sql, gt_id);
		if(num<=0){
			throw new Exception("删除失败!请联系管理员!");
		}
	}
	
	
	
	
}
