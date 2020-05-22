package com.wrf.shop.sys.model;

/**
 @ClassName ShopCar
 * @Description 购物车商品类
 * @Author invincible
 * @Date 2018年3月23日 下午8:47:41
 */
public class ShopCar {
	private Integer sc_id;
	private Integer sc_goods_id;
	private Integer sc_client_id;
	private Integer sc_number;
	private String sc_create_time;
	private Integer g_id;
	private String g_name;
	private String g_logo;
	private double g_price;
	
	public Integer getSc_id() {
		return sc_id;
	}
	public void setSc_id(Integer sc_id) {
		this.sc_id = sc_id;
	}
	public Integer getSc_goods_id() {
		return sc_goods_id;
	}
	public void setSc_goods_id(Integer sc_goods_id) {
		this.sc_goods_id = sc_goods_id;
	}
	public Integer getSc_client_id() {
		return sc_client_id;
	}
	public void setSc_client_id(Integer sc_client_id) {
		this.sc_client_id = sc_client_id;
	}
	public String getSc_create_time() {
		return sc_create_time;
	}
	public void setSc_create_time(String sc_create_time) {
		this.sc_create_time = sc_create_time;
	}
	
	public Integer getSc_number() {
		return sc_number;
	}
	public void setSc_number(Integer sc_number) {
		this.sc_number = sc_number;
	}
	
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
	public String getG_logo() {
		return g_logo;
	}
	public void setG_logo(String g_logo) {
		this.g_logo = g_logo;
	}
	public double getG_price() {
		return g_price;
	}
	public void setG_price(double g_price) {
		this.g_price = g_price;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ShopCar [sc_id=");
		builder.append(sc_id);
		builder.append(", sc_goods_id=");
		builder.append(sc_goods_id);
		builder.append(", sc_client_id=");
		builder.append(sc_client_id);
		builder.append(", sc_number=");
		builder.append(sc_number);
		builder.append(", sc_create_time=");
		builder.append(sc_create_time);
		builder.append(", g_id=");
		builder.append(g_id);
		builder.append(", g_name=");
		builder.append(g_name);
		builder.append(", g_logo=");
		builder.append(g_logo);
		builder.append(", g_price=");
		builder.append(g_price);
		builder.append("]");
		return builder.toString();
	}
	
}
