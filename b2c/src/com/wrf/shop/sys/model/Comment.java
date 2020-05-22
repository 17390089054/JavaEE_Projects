package com.wrf.shop.sys.model;

/**
 @ClassName Comment
 * @Description 
 * @Author invincible
 * @Date 2018年3月18日 下午3:17:06
 */
public class Comment {
	private Integer gc_id;
	private Integer gc_client_id;
	private Integer gc_goods_id;
	private String gc_content;
	private String gc_create_time;
	private String c_name;
	private String c_photo;
	private String g_name;
	private Double g_price;
	private String g_logo;
	private String gc_reply_time;
	private String gc_reply;
	public Integer getGc_id() {
		return gc_id;
	}
	public void setGc_id(Integer gc_id) {
		this.gc_id = gc_id;
	}
	public Integer getGc_client_id() {
		return gc_client_id;
	}
	public void setGc_client_id(Integer gc_client_id) {
		this.gc_client_id = gc_client_id;
	}
	public Integer getGc_goods_id() {
		return gc_goods_id;
	}
	public void setGc_goods_id(Integer gc_goods_id) {
		this.gc_goods_id = gc_goods_id;
	}
	public String getGc_content() {
		return gc_content;
	}
	public void setGc_content(String gc_content) {
		this.gc_content = gc_content;
	}
	public String getGc_create_time() {
		return gc_create_time;
	}
	public void setGc_create_time(String gc_create_time) {
		this.gc_create_time = gc_create_time;
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
	public String getG_logo() {
		return g_logo;
	}
	public void setG_logo(String g_logo) {
		this.g_logo = g_logo;
	}
	
	public String getGc_reply() {
		return gc_reply;
	}
	public void setGc_reply(String gc_reply) {
		this.gc_reply = gc_reply;
	}
	public String getGc_reply_time() {
		return gc_reply_time;
	}
	public void setGc_reply_time(String gc_reply_time) {
		this.gc_reply_time = gc_reply_time;
	}
	public String getC_photo() {
		return c_photo;
	}
	public void setC_photo(String c_photo) {
		this.c_photo = c_photo;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Comment [gc_id=");
		builder.append(gc_id);
		builder.append(", gc_client_id=");
		builder.append(gc_client_id);
		builder.append(", gc_goods_id=");
		builder.append(gc_goods_id);
		builder.append(", gc_content=");
		builder.append(gc_content);
		builder.append(", gc_create_time=");
		builder.append(gc_create_time);
		builder.append(", c_name=");
		builder.append(c_name);
		builder.append(", c_photo=");
		builder.append(c_photo);
		builder.append(", g_name=");
		builder.append(g_name);
		builder.append(", g_price=");
		builder.append(g_price);
		builder.append(", g_logo=");
		builder.append(g_logo);
		builder.append(", gc_reply_time=");
		builder.append(gc_reply_time);
		builder.append(", gc_reply=");
		builder.append(gc_reply);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
}
