package com.wrf.shop.sys.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.wrf.shop.sys.model.BarChart;
import com.wrf.shop.sys.model.PieChart;
import com.wrf.shop.sys.util.DBUtil;

/**
 @ClassName ChartServices
 * @Description 
 * @Author invincible
 * @Date 2018年5月6日 下午8:03:59
 */
public class ChartServices {
	
	/**
	 * @Title: getBarChart   
	 * @Description: TODO(生成直方图)   
	 * @param: @return      
	 * @return: List<BarChart>      
	 * @throws
	 */
	public static List<BarChart> getBarChart(){
		List<BarChart>barList=new ArrayList<>();
		String sql="select g.g_id,g.g_name,gt.gt_name,sum(go.go_money) sale from goods_order go,goods g,goods_type gt where go.go_id=g.g_id  and g.g_type_id=gt.gt_id group by gt.gt_name order by sale desc";
		List<Map<String, Object>> list = DBUtil.list(sql);
		if(list!=null&&list.size()>0){
			for(Map<String, Object> map:list){
				BarChart barChart = new BarChart();
				try {
					BeanUtils.populate(barChart, map);
				} catch (Exception e) {
					e.printStackTrace();
				}
				barList.add(barChart);
			}
		}
		return barList;
	}
	
	/**
	 * @Title: getPieChart   
	 * @Description: TODO(生成饼图)   
	 * @param: @return      
	 * @return: List<PieChart>      
	 * @throws
	 */
	public static List<PieChart> getPieChart(){
		List<PieChart>pieList=new ArrayList<>();
		String sql="select count(*) as total ,g_name from goods_comment ,goods where gc_goods_id=g_id group by gc_goods_id";
		List<Map<String, Object>> list = DBUtil.list(sql);
		if(list!=null&&list.size()>0){
			for(Map<String, Object> map:list){
				PieChart pieChart = new PieChart();
				try {
					BeanUtils.populate(pieChart, map);
				} catch (Exception e) {
					e.printStackTrace();
				}
				pieList.add(pieChart);
			}
		}
		return pieList;
	}
	
	
	
}
