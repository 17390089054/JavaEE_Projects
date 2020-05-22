package com.wrf.shop.sys.model;

/**
 @ClassName GoodsType
 * @Description goodsTypeBean
 * @Author invincible
 * @Date 2018年2月24日 上午9:47:49
 */
public class GoodsType {
	private Integer gt_id;//商品类别ID
	private String gt_name;//商品名称
	private Integer gt_parent_id;//商品父类ID
	
	public Integer getGt_id() {
		return gt_id;
	}
	public void setGt_id(Integer gt_id) {
		this.gt_id = gt_id;
	}
	public String getGt_name() {
		return gt_name;
	}
	public void setGt_name(String gt_name) {
		this.gt_name = gt_name;
	}
	public Integer getGt_parent_id() {
		return gt_parent_id;
	}
	public void setGt_parent_id(Integer gt_parent_id) {
		this.gt_parent_id = gt_parent_id;
	}
	
	@Override
	public String toString() {
		return "GoodsType [gt_id=" + gt_id + ", gt_name=" + gt_name + ", gt_parent_id=" + gt_parent_id + "]";
	}
	
}
