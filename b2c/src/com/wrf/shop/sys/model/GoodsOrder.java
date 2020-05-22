package com.wrf.shop.sys.model;

/**
 @ClassName GoodsOrder
 * @Description 
 * @Author invincible
 * @Date 2018年3月9日 下午11:12:53
 */
public class GoodsOrder {
	private Integer go_id;
	private String go_code;
	private Integer go_client_id;
	private Integer go_goods_id;
	private Integer go_address_id;
	private Integer go_status;
	private String go_create_time;
	private String go_finish_time;
	private String go_money;
	/*关联用户与地区信息*/
	private String c_name;
	private String g_name;
	private String g_logo;
	private Double g_price;
	private String province_name;
	private String city_name;
	private String area_name;
	private String a_desc;
	private String a_tel;
	
	
	
	public Integer getGo_id() {
		return go_id;
	}
	public void setGo_id(Integer go_id) {
		this.go_id = go_id;
	}
	public Integer getGo_client_id() {
		return go_client_id;
	}
	public void setGo_client_id(Integer go_client_id) {
		this.go_client_id = go_client_id;
	}
	public Integer getGo_goods_id() {
		return go_goods_id;
	}
	public void setGo_goods_id(Integer go_goods_id) {
		this.go_goods_id = go_goods_id;
	}
	public Integer getGo_address_id() {
		return go_address_id;
	}
	public void setGo_address_id(Integer go_address_id) {
		this.go_address_id = go_address_id;
	}
	public Integer getGo_status() {
		return go_status;
	}
	public void setGo_status(Integer go_status) {
		this.go_status = go_status;
	}
	public String getGo_create_time() {
		return go_create_time;
	}
	public void setGo_create_time(String go_create_time) {
		this.go_create_time = go_create_time;
	}
	public String getGo_finish_time() {
		return go_finish_time;
	}
	public void setGo_finish_time(String go_finish_time) {
		this.go_finish_time = go_finish_time;
	}
	public String getGo_money() {
		return go_money;
	}
	public void setGo_money(String go_money) {
		this.go_money = go_money;
	}
	public String getGo_code() {
		return go_code;
	}
	public void setGo_code(String go_code) {
		this.go_code = go_code;
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
	public String getG_logo() {
		return g_logo;
	}
	public void setG_logo(String g_logo) {
		this.g_logo = g_logo;
	}
	public Double getG_price() {
		return g_price;
	}
	public void setG_price(Double g_price) {
		this.g_price = g_price;
	}
	public String getProvince_name() {
		return province_name;
	}
	public void setProvince_name(String province_name) {
		this.province_name = province_name;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public String getA_desc() {
		return a_desc;
	}
	public void setA_desc(String a_desc) {
		this.a_desc = a_desc;
	}
	public String getA_tel() {
		return a_tel;
	}
	public void setA_tel(String a_tel) {
		this.a_tel = a_tel;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GoodsOrder [go_id=");
		builder.append(go_id);
		builder.append(", go_code=");
		builder.append(go_code);
		builder.append(", go_client_id=");
		builder.append(go_client_id);
		builder.append(", go_goods_id=");
		builder.append(go_goods_id);
		builder.append(", go_address_id=");
		builder.append(go_address_id);
		builder.append(", go_status=");
		builder.append(go_status);
		builder.append(", go_create_time=");
		builder.append(go_create_time);
		builder.append(", go_finish_time=");
		builder.append(go_finish_time);
		builder.append(", go_money=");
		builder.append(go_money);
		builder.append(", c_name=");
		builder.append(c_name);
		builder.append(", g_name=");
		builder.append(g_name);
		builder.append(", g_logo=");
		builder.append(g_logo);
		builder.append(", g_price=");
		builder.append(g_price);
		builder.append(", province_name=");
		builder.append(province_name);
		builder.append(", city_name=");
		builder.append(city_name);
		builder.append(", area_name=");
		builder.append(area_name);
		builder.append(", a_desc=");
		builder.append(a_desc);
		builder.append(", a_tel=");
		builder.append(a_tel);
		builder.append("]");
		return builder.toString();
	}
}
