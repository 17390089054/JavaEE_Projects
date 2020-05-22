package com.wrf.shop.sys.model;

/**
 @ClassName Collect
 * @Description 
 * @Author invincible
 * @Date 2018年3月17日 下午11:43:02
 */
public class Collection {
	private Integer co_id;
	private Integer co_client_id;
	private Integer co_goods_id;
	private String co_create_time;
	private String c_name;
	private String g_name;
	private Double g_price;
	private String g_addr;
	private String g_logo;
	private Integer g_status;
	private String g_create_time;
	
	public Integer getCo_id() {
		return co_id;
	}
	public void setCo_id(Integer co_id) {
		this.co_id = co_id;
	}
	public Integer getCo_client_id() {
		return co_client_id;
	}
	public void setCo_client_id(Integer co_client_id) {
		this.co_client_id = co_client_id;
	}
	public Integer getCo_goods_id() {
		return co_goods_id;
	}
	public void setCo_goods_id(Integer co_goods_id) {
		this.co_goods_id = co_goods_id;
	}
	public String getCo_create_time() {
		return co_create_time;
	}
	public void setCo_create_time(String co_create_time) {
		this.co_create_time = co_create_time;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public Double getG_price() {
		return g_price;
	}
	public void setG_price(Double g_price) {
		this.g_price = g_price;
	}
	public String getG_addr() {
		return g_addr;
	}
	public void setG_addr(String g_addr) {
		this.g_addr = g_addr;
	}
	public String getG_logo() {
		return g_logo;
	}
	public void setG_logo(String g_logo) {
		this.g_logo = g_logo;
	}
	public Integer getG_status() {
		return g_status;
	}
	public void setG_status(Integer g_status) {
		this.g_status = g_status;
	}
	public String getG_create_time() {
		return g_create_time;
	}
	public void setG_create_time(String g_create_time) {
		this.g_create_time = g_create_time;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Collect [co_id=");
		builder.append(co_id);
		builder.append(", co_client_id=");
		builder.append(co_client_id);
		builder.append(", co_goods_id=");
		builder.append(co_goods_id);
		builder.append(", co_create_time=");
		builder.append(co_create_time);
		builder.append(", c_name=");
		builder.append(c_name);
		builder.append(", g_name=");
		builder.append(g_name);
		builder.append(", g_price=");
		builder.append(g_price);
		builder.append(", g_addr=");
		builder.append(g_addr);
		builder.append(", g_logo=");
		builder.append(g_logo);
		builder.append(", g_status=");
		builder.append(g_status);
		builder.append(", g_create_time=");
		builder.append(g_create_time);
		builder.append("]");
		return builder.toString();
	}
	
	

}
