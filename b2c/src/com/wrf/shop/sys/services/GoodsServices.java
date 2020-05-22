package com.wrf.shop.sys.services;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringEscapeUtils;

import com.wrf.shop.sys.model.Goods;
import com.wrf.shop.sys.model.UploadBean;
import com.wrf.shop.sys.util.DBUtil;

/**
 @ClassName GoodsServices
 * @Description goodsService
 * @Author invincible
 * @Date 2018年2月26日 上午10:45:58
 */
public class GoodsServices {
	/**
	 * @Title: addGoods   
	 * @Description: TODO(添加商品)   
	 * @param: @param goods
	 * @param: @return
	 * @param: @throws Exception      
	 * @return: int      
	 * @throws
	 */
	public int  addGoods(Goods goods) throws Exception{
		String sql="insert into goods (g_name,g_price,g_number,g_addr,g_desc,g_logo,g_type_id,g_user_id,g_create_time) values "
				+ "(?,?,?,?,?,?,?,?,?)";
		int num=DBUtil.insert(sql, new Object[]{
				goods.getG_name(),
				goods.getG_price(),
				goods.getG_number(),
				goods.getG_addr(),
				goods.getG_desc(),
				goods.getG_logo(),
				goods.getG_type_id(),
				goods.getG_user_id(),
				goods.getG_create_time()
		});
		return num;
		
	}
	/**
	 * @Title: addGoodsMany   
	 * @Description: TODO(多文件上传)   
	 * @param: @param upload
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void addGoodsMany(UploadBean upload) throws Exception{
		List<String> list = upload.getList();
		for(int i=0;i<list.size();i++){
			String sql="insert into goods_photo (gp_url,gp_goods_id) values(?,?)";
			DBUtil.executeUpdate(sql, new Object[]{
					list.get(i),
					Integer.parseInt(upload.getMap().get("gp_goods_id").toString())
					
			});
		}
	}
	
	/**
	 * @Title: selectGoods   
	 * @Description: TODO(商品信息查询方法)   
	 * @param: @return      
	 * @return: List<Goods>      
	 * @throws
	 */
	
	public  List<Goods> selectGoods(){
		String sql="select * from goods ,goods_type,user where g_type_id=gt_id and g_user_id=user_id";
		List<Goods>goodsList=new ArrayList<>();
		List<Map<String, Object>> list = DBUtil.list(sql);
		for(Map<String, Object>map:list){
			Goods goods=new Goods();
			try {
				BeanUtils.populate(goods, map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		goodsList.add(goods);
		}
		return goodsList;
	}
	
	/**
	 * @Title: deleteGoods   
	 * @Description: TODO(商品下架)   
	 * @param: @param g_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void deleteGoods(int g_id) throws Exception{
		String sql="update goods set g_status=0 where g_id=?";
		int num=DBUtil.executeUpdate(sql, g_id);
		if(num<0){
			throw new Exception("出现未知错误!请联系管理员!");
		}
		
	}
	
	/**
	 * @Title: queryGoods   
	 * @Description: TODO(查询商品信息)   
	 * @param: @param g_id
	 * @param: @return      
	 * @return: Goods      
	 * @throws
	 */
	public  Goods queryGoods(int g_id){
		String sql="select * from goods where g_id=?";
		Goods goods=new Goods();
		Map<String, Object> map = DBUtil.query(sql, g_id);
		if(map!=null){
			try {
				BeanUtils.populate(goods, map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return goods;
	}
	
	/**
	 * @Title: ReviseGoods   
	 * @Description: TODO(修改商品信息)   
	 * @param: @param goods
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void ReviseGoods(Goods goods) throws Exception{
		String sql="update goods set g_name=?,g_number=?,g_addr=?,g_desc=?,g_logo=?,g_type_id=? where g_id=?";
		int num=DBUtil.executeUpdate(sql, new Object[]{
				goods.getG_name(),
				goods.getG_number(),
				goods.getG_addr(),
				goods.getG_desc(),
				goods.getG_logo(),
				goods.getG_type_id(),
				goods.getG_id()
		});
		if(num<0){
			throw new Exception("出现未知错误!请联系管理员!");
		}
		
	}
	/**
	 * @Title: selectGoodsList   
	 * @Description: TODO(查询商品列表)   
	 * @param: @return      
	 * @return: List<Goods>      
	 * @throws
	 */
	public static List<Goods> selectGoodsList(){
		List<Goods>queryList=new ArrayList<>();
		String sql="select * from goods,goods_type where g_type_id=gt_id  and g_status=1 order by g_id desc limit 8";
		List<Map<String, Object>> list = DBUtil.list(sql);
		for(Map<String,Object>map:list){
			Goods goods=new Goods();
			try {
				BeanUtils.populate(goods, map);
				queryList.add(goods);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return queryList;
	}
	
	/**
	 * @Title: getGoodsItem   
	 * @Description: TODO(查询商品类别 图片信息)   
	 * @param: @param g_id
	 * @param: @return      
	 * @return: Goods      
	 * @throws
	 */
	public Goods  getGoodsItem(int g_id){
		String sql="select * from goods ,goods_type   where g_type_id=gt_id  and g_id=?";
		 Map<String, Object> map = DBUtil.query(sql,g_id);
		//转换为Goods对象
		Goods goods=new Goods();
		 if(map!=null&&map.size()>0){
			try {
				BeanUtils.populate(goods,map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return goods;
	}
	
	
	/**
	 * @Title: photoList   
	 * @Description: TODO(商品图片列表)   
	 * @param: @param g_id
	 * @param: @return      
	 * @return: List<String>      
	 * @throws
	 */
	public List<String>photoList(int g_id){
		String sql="select * from goods_photo where gp_goods_id=?";
		List<String> rList=new ArrayList<>();
		List<Map<String, Object>> list = DBUtil.list(sql, g_id);
		if(list!=null&&list.size()>0){
			for(Map<String,Object>map:list){
				rList.add(map.get("gp_url").toString());
			}
		}
		return rList;
	}
	
	
	/**
	 * @Title: selectGoodsAlike   
	 * @Description: TODO(查询相似商品)   
	 * @param: @param gt_name
	 * @param: @return      
	 * @return: List<Goods>      
	 * @throws
	 */
	public  List<Goods> selectGoodsAlike(String gt_name){
		List<Goods>resultList=new ArrayList<>();
		String sql="select * from goods ,goods_type where g_type_id=gt_id and gt_name like '%"+StringEscapeUtils.escapeSql(gt_name)+"%' limit 6 ";
		List<Map<String, Object>> list = DBUtil.list(sql);
		if(list!=null&&list.size()>0){
			for(Map<String,Object>map:list){
				Goods goods=new Goods();
				try {
					BeanUtils.populate(goods, map);
				} catch (Exception e) {
					e.printStackTrace();
				}
				resultList.add(goods);
			}			
			return resultList;
		}
		return null;
	}
	
	/**
	 * @Title: SelectOtherGoods   
	 * @Description: TODO(查询其他商品)   
	 * @param: @return      
	 * @return: List<Goods>      
	 * @throws
	 */
	public  List<Goods> selectOtherGoods(){
		String sql="select * from goods order by g_id desc limit 6";
		List<Goods>goodsList=new ArrayList<>();
		List<Map<String, Object>> list = DBUtil.list(sql);
		for(Map<String,Object>map:list){
			Goods goods=new Goods();
				try {
					BeanUtils.populate(goods, map);
					goodsList.add(goods);
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		
		return goodsList;
	}
	
	
	/**
	 * @Title: searchGoods   
	 * @Description: TODO(这里用一句话描述这个方法的作用)   
	 * @param: @param cn
	 * @param: @return      
	 * @return: List<Goods>      
	 * @throws
	 */
	public  List<Goods>searchGoods(String cn){
		String sql="select * from (select * from goods ,goods_type where g_type_id=gt_id)as t where g_name like '%"+StringEscapeUtils.escapeSql(cn)+"%' or gt_name like '%"+StringEscapeUtils.escapeSql(cn)+"%'";
		List<Map<String, Object>> list = DBUtil.list(sql);
		List<Goods>goodsList=new ArrayList<>();
		if(list!=null&&list.size()>0){
			for(Map<String,Object>map:list){
				Goods goods=new Goods();
				try {
					BeanUtils.populate(goods, map);
					goodsList.add(goods);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return goodsList;
	}
	
	/**
	 * @Title: goodsCount   
	 * @Description: TODO(查询记录总条数)   
	 * @param: @param cn
	 * @param: @return      
	 * @return: int      
	 * @throws
	 */
	public int goodsCount(String cn){
		int number=0;
		String sql="select count(*) as num from (select * from goods ,goods_type where g_type_id=gt_id)as t where g_name like '%"+StringEscapeUtils.escapeSql(cn)+"%' or gt_name like '%"+StringEscapeUtils.escapeSql(cn)+"%'";
		Map<String, Object> map = DBUtil.query(sql);
		if(map!=null&&map.size()>0){
			String num= map.get("num").toString();
			number=Integer.parseInt(num);
		}
		
		return number;
	}
	
	/**
	 * @Title: goodsList   
	 * @Description: TODO(分页查询数据)   
	 * @param: @param cn
	 * @param: @param num
	 * @param: @param type
	 * @param: @return      
	 * @return: List<Goods>      
	 * @throws
	 */
	public  List<Goods>goodsList(String cn,int num,int type){
		//根据type的值拼接不同的SQL
		//1.综合   2.库存   3.最新上映   4.价格(由高到低)  5.价格(由低到高)
		String sql="select * from (select * from goods ,goods_type where g_type_id=gt_id)as t where g_name like '%"+StringEscapeUtils.escapeSql(cn)+"%' or gt_name like '%"+StringEscapeUtils.escapeSql(cn)+"%'";
		if(type==1){
			sql+="limit "+num;
		}
		if(type==2){
			sql+="order by  g_number desc limit "+num;
		}
		if(type==3){
			sql+="order by g_create_time desc limit "+num;
		}
		if(type==4){
			sql+="order by g_price desc limit "+num;
		}
		if(type==5){
			sql+="order by g_price asc limit "+num;
		}
		List<Goods>rList=new ArrayList<>();
		List<Map<String, Object>> list = DBUtil.list(sql);
		if(list!=null&list.size()>0){
			for(Map<String,Object>map:list){
				Goods goods=new Goods();
				try {
					BeanUtils.populate(goods, map);
					rList.add(goods);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return rList;
	}
	
	/**
	 * @Title: goodsClassList   
	 * @Description: TODO(查询指定父类别下的所有商品)   
	 * @param: @param gt_parent_id
	 * @param: @return      
	 * @return: List<Goods>      
	 * @throws
	 */
	public static List<Goods>goodsClassList(int gt_parent_id){
		List<Goods>gcList=new ArrayList<>();
		String sql="select * from goods ,goods_type where g_type_id=gt_id and g_status=1 and gt_parent_id=?";
		List<Map<String, Object>> list = DBUtil.list(sql, gt_parent_id);
		if(list!=null&&list.size()>0){
			for(Map<String,Object>map:list){
				Goods g=new Goods();
				try {
					BeanUtils.populate(g,map);
					gcList.add(g);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return gcList;
	}
	
	/**
	 * @Title: imgList   
	 * @Description: TODO(查询图片列表)   
	 * @param: @param type_id
	 * @param: @return      
	 * @return: List<Goods>      
	 * @throws
	 */
	public List<Goods>imgList(int type_id){
		List<Goods>gcList=new ArrayList<>();
		String sql="select * from goods ,goods_type where g_type_id=gt_id and gt_parent_id=? order by g_id limit 3";
		List<Map<String, Object>> list = DBUtil.list(sql,type_id);
		if(list!=null&&list.size()>0){
			for(Map<String,Object>map:list){
			Goods goods=new Goods();
			try {
				BeanUtils.populate(goods, map);
				gcList.add(goods);
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
		}
		return gcList;
		
	}
	
	
	
	
	
	/**
	 * @Title: goodsClassList   
	 * @Description: TODO(查询所有类别商品)   
	 * @param: @return      
	 * @return: List<Goods>      
	 * @throws
	 */
	public  List<Goods>goodsClassList(){
		List<Goods>gcList=new ArrayList<>();
		String sql="select * from goods ,goods_type where g_type_id=gt_id ";
		List<Map<String, Object>> list = DBUtil.list(sql);
		if(list!=null&&list.size()>0){
			for(Map<String,Object>map:list){
				Goods g=new Goods();
				try {
					BeanUtils.populate(g,map);
					gcList.add(g);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return gcList;
	}
	
	/**
	 * @Title: goodsRecommandList   
	 * @Description: TODO(商品推荐列表)   
	 * @param: @return      
	 * @return: List<Goods>      
	 * @throws
	 */
	 public List<Goods>goodsRecommandList(int g_type_id){
		 List<Goods>gcList=new ArrayList<>();
		 String sql="select * from goods where g_status=1 and g_type_id=?";
		 List<Map<String, Object>> list = DBUtil.list(sql,g_type_id);
			if(list!=null&&list.size()>0){
				for(Map<String,Object>map:list){
					Goods g=new Goods();
					try {
						BeanUtils.populate(g,map);
						gcList.add(g);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			return gcList;
		 
		 
	 }
	
	 
	
	
}
