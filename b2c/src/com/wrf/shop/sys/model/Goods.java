package com.wrf.shop.sys.model;

import java.util.List;

/**
 @ClassName Goods
 * @Description 商品类
 * @Author invincible
 * @Date 2018年2月25日 下午5:29:23
 */
public class Goods {
	private Integer g_id;
	private String g_name;
	private Double g_price;
	private Long g_number;
	private String g_addr;
	private String g_desc;
	private String g_logo;
	private Integer g_status;
	private Integer g_user_id;
	private Integer g_type_id;
	private String g_create_time;
	private String gt_name;
	private String user_name;
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
	
	public Long getG_number() {
		return g_number;
	}
	public void setG_number(Long g_number) {
		this.g_number = g_number;
	}
	public String getG_addr() {
		return g_addr;
	}
	public void setG_addr(String g_addr) {
		this.g_addr = g_addr;
	}
	public String getG_desc() {
		return g_desc;
	}
	public void setG_desc(String g_desc) {
		this.g_desc = g_desc;
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
	public Integer getG_user_id() {
		return g_user_id;
	}
	public void setG_user_id(Integer g_user_id) {
		this.g_user_id = g_user_id;
	}
	public Integer getG_type_id() {
		return g_type_id;
	}
	public void setG_type_id(Integer g_type_id) {
		this.g_type_id = g_type_id;
	}
	public String getG_create_time() {
		return g_create_time;
	}
	public void setG_create_time(String g_create_time) {
		this.g_create_time = g_create_time;
	}
	
	public String getGt_name() {
		return gt_name;
	}
	public void setGt_name(String gt_name) {
		this.gt_name = gt_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Double getG_price() {
		return g_price;
	}
	public void setG_price(Double g_price) {
		this.g_price = g_price;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Goods [g_id=");
		builder.append(g_id);
		builder.append(", g_name=");
		builder.append(g_name);
		builder.append(", g_price=");
		builder.append(g_price);
		builder.append(", g_number=");
		builder.append(g_number);
		builder.append(", g_addr=");
		builder.append(g_addr);
		builder.append(", g_desc=");
		builder.append(g_desc);
		builder.append(", g_logo=");
		builder.append(g_logo);
		builder.append(", g_status=");
		builder.append(g_status);
		builder.append(", g_user_id=");
		builder.append(g_user_id);
		builder.append(", g_type_id=");
		builder.append(g_type_id);
		builder.append(", g_create_time=");
		builder.append(g_create_time);
		builder.append(", gt_name=");
		builder.append(gt_name);
		builder.append(", user_name=");
		builder.append(user_name);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
	
	
	
	
	
}
