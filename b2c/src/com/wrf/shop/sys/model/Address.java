package com.wrf.shop.sys.model;

/**
 @ClassName Address
 * @Description 
 * @Author invincible
 * @Date 2018年3月9日 下午6:49:02
 */
public class Address {
	private Integer a_id;
	private Integer a_province_id;
	private Integer a_city_id;
	private Integer a_area_id;
	private Integer a_client_id;
	private Integer a_status;
	private String a_desc;
	private String c_name;
	private String a_tel;
	private String province_name;
	private String city_name;
	private String area_name;
	
	public Integer getA_id() {
		return a_id;
	}
	public void setA_id(Integer a_id) {
		this.a_id = a_id;
	}
	public Integer getA_province_id() {
		return a_province_id;
	}
	public void setA_province_id(Integer a_province_id) {
		this.a_province_id = a_province_id;
	}
	public Integer getA_city_id() {
		return a_city_id;
	}
	public void setA_city_id(Integer a_city_id) {
		this.a_city_id = a_city_id;
	}
	public Integer getA_area_id() {
		return a_area_id;
	}
	public void setA_area_id(Integer a_area_id) {
		this.a_area_id = a_area_id;
	}
	public Integer getA_client_id() {
		return a_client_id;
	}
	public void setA_client_id(Integer a_client_id) {
		this.a_client_id = a_client_id;
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
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
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
	public Integer getA_status() {
		return a_status;
	}
	public void setA_status(Integer a_status) {
		this.a_status = a_status;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Address [a_id=");
		builder.append(a_id);
		builder.append(", a_province_id=");
		builder.append(a_province_id);
		builder.append(", a_city_id=");
		builder.append(a_city_id);
		builder.append(", a_area_id=");
		builder.append(a_area_id);
		builder.append(", a_client_id=");
		builder.append(a_client_id);
		builder.append(", a_status=");
		builder.append(a_status);
		builder.append(", a_desc=");
		builder.append(a_desc);
		builder.append(", c_name=");
		builder.append(c_name);
		builder.append(", a_tel=");
		builder.append(a_tel);
		builder.append(", province_name=");
		builder.append(province_name);
		builder.append(", city_name=");
		builder.append(city_name);
		builder.append(", area_name=");
		builder.append(area_name);
		builder.append("]");
		return builder.toString();
	}
	
	
}
