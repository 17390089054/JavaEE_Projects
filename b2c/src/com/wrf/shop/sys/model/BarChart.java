package com.wrf.shop.sys.model;

/**
 @ClassName BarChart
 * @Description 
 * @Author invincible
 * @Date 2018年5月6日 下午8:06:07
 */
public class BarChart {
	private Integer g_id;
	private String g_name;
	private String gt_name;
	private Double sale;
	
	public Integer getG_id() {
		return g_id;
	}
	public void setG_id(Integer g_id) {
		this.g_id = g_id;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getGt_name() {
		return gt_name;
	}
	public void setGt_name(String gt_name) {
		this.gt_name = gt_name;
	}
	public Double getSale() {
		return sale;
	}
	public void setSale(Double sale) {
		this.sale = sale;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BarChart [g_id=");
		builder.append(g_id);
		builder.append(", g_name=");
		builder.append(g_name);
		builder.append(", gt_name=");
		builder.append(gt_name);
		builder.append(", sale=");
		builder.append(sale);
		builder.append("]");
		return builder.toString();
	}

}
