package com.wrf.shop.sys.model;

import java.util.List;
import java.util.Map;
/**
 @ClassName UploadBean
 * @Description 上传用户Bean 
 * @Author invincible
 * @Date 2018年2月25日 下午5:02:29
 */
public class UploadBean {

	private Map<String,Object> map;
	private List<String> list;
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	public List<String> getList() {
		return list;
	}
	public void setList(List<String> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "UploadUtil [map=" + map + ", list=" + list + "]";
	}
	
}
