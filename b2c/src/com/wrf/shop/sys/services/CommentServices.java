package com.wrf.shop.sys.services;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.wrf.shop.sys.model.Comment;
import com.wrf.shop.sys.util.DBUtil;

/**
 @ClassName CommentServices
 * @Description(发布评价) 
 * @Author invincible
 * @Date 2018年3月18日 下午2:36:55
 */
public class CommentServices {
	/**
	 * @Title: addComment   
	 * @Description: TODO(添加评论)   
	 * @param: @param com
	 * @param: @param go_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void addComment(Comment com,int go_id) throws Exception{
		String sql="insert into goods_comment (gc_client_id,gc_goods_id,gc_content,gc_create_time) values (?,?,?,?)";
		int num1=DBUtil.executeUpdate(sql, new Object[]{
				com.getGc_client_id(),
				com.getGc_goods_id(),
				com.getGc_content(),
				com.getGc_create_time()
		});
		String sql2="update goods_order set go_status=5 where go_id=?";
		int num2=DBUtil.executeUpdate(sql2, go_id);
		if(num1<0||num2<0){
			throw new Exception("遇到未知错误!请联系管理员!");
		}
	}
	
	/**
	 * @Title: selectList   
	 * @Description: TODO(查询所有评论结果)   
	 * @param: @return      
	 * @return: List<Comment>      
	 * @throws
	 */
	public List<Comment>selectList(){
		String sql="select * from goods_comment,goods,client where gc_goods_id=g_id and gc_client_id=c_id order by gc_create_time desc";
		List<Comment>rList=new ArrayList<>();
		List<Map<String, Object>> list = DBUtil.list(sql);
		for(Map<String,Object>map:list){
			Comment com=new Comment();
			try {
				BeanUtils.populate(com, map);
				rList.add(com);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return rList;
	}
	
	/**
	 * @Title: selectList   
	 * @Description: TODO(查询某个用户的评价记录)   
	 * @param: @param c_id
	 * @param: @return      
	 * @return: List<Comment>      
	 * @throws
	 */
	public  List<Comment>selectList(int c_id){
		String sql="select * from goods_comment,goods,client where gc_goods_id=g_id and gc_client_id=c_id and c_id=? order by gc_create_time desc";
		List<Comment>rList=new ArrayList<>();
		List<Map<String, Object>> list = DBUtil.list(sql, c_id);
		for(Map<String,Object>map:list){
			Comment com=new Comment();
			try {
				BeanUtils.populate(com, map);
				rList.add(com);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return rList;
	}
	
	/**
	 * @Title: deleteComment   
	 * @Description: TODO(删除评价信息)   
	 * @param: @param gc_id
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void deleteComment(int gc_id) throws Exception{
		String sql="delete from goods_comment where gc_id=?";
		int num=DBUtil.executeUpdate(sql, gc_id);
		if(num<0){
			throw new Exception("遇到未知错误!请联系管理员!");
		}
	}
	
	/**
	 * @Title: commentList   
	 * @Description: TODO(相关商品评价)   
	 * @param: @param g_id
	 * @param: @return      
	 * @return: List<Comment>      
	 * @throws
	 */
	public List<Comment>commentList(int g_id){
		String sql="select * from goods_comment,goods,client where gc_goods_id=g_id and gc_client_id=c_id and g_id=? order by gc_create_time desc ";
		List<Comment>rList=new ArrayList<>();
		List<Map<String, Object>> list = DBUtil.list(sql, g_id);
		for(Map<String,Object>map:list){
			Comment com=new Comment();
			try {
				BeanUtils.populate(com, map);
				rList.add(com);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	return rList;	
	}
	
	/**
	 * @Title: addReply   
	 * @Description: TODO(卖家回复方法)   
	 * @param: @param gc_id
	 * @param: @param gc_reply
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	public void addReply(Integer gc_id,String gc_reply,String gc_reply_time) throws Exception{
		String sql="update goods_comment set gc_reply=?,gc_reply_time=? where gc_id=?";
		int num=DBUtil.executeUpdate(sql, new Object[]{
			gc_reply,
			gc_reply_time,
			gc_id
		});
		if(num<0){
			throw new Exception("遇到未知错误!请联系管理员!");
		}
		
		
	}
	
	
	
	
}
