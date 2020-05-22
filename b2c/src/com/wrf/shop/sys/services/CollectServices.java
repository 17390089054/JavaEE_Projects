package com.wrf.shop.sys.services;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.commons.beanutils.BeanUtils;
import com.wrf.shop.sys.model.Collection;
import com.wrf.shop.sys.util.DBUtil;

/**
 @ClassName CollectServices
 * @Description (查询收藏夹列表)
 * @Author invincible
 * @Date 2018年3月17日 下午11:42:36
 */
public class CollectServices {
	public  List<Collection>selectCollections(int c_id){
		List<Collection>rList=new ArrayList<>();
		String sql="select * from collection ,client ,goods where co_client_id=c_id and co_goods_id=g_id and co_client_id=? order by co_id desc ";
		List<Map<String, Object>> list = DBUtil.list(sql, c_id);
		if(list!=null&&list.size()>0){
			for(Map<String,Object>map:list){
				Collection col=new Collection();
				try {
					BeanUtils.populate(col, map);
				} catch (Exception e) {
					e.printStackTrace();
				}
				rList.add(col);
			}
		}
		return rList;
	}
	
	/**
	 * @Title: deleteCollection   
	 * @Description: TODO(删除收藏夹信息)   
	 * @param: @param co_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void deleteCollection(int co_id) throws Exception{
		String sql="delete from collection where co_id=?";
		int num=DBUtil.executeUpdate(sql, co_id);
		if(num<0){
			throw new Exception("遇到未知错误!请联系管理员!");
		}
	}
	
	
	
}
