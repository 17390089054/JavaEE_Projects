package com.wrf.shop.sys.model;

/**
 @ClassName PieChart
 * @Description 
 * @Author invincible
 * @Date 2018年5月6日 下午8:45:34
 */
public class PieChart {
	private int total;
	private String g_name;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PieChart [total=");
		builder.append(total);
		builder.append(", g_name=");
		builder.append(g_name);
		builder.append("]");
		return builder.toString();
	}
	
}
