package com.wrf.rbac.common.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Pager {
	private Integer pageNow = 1;
	private Integer pageSize = 3;
	private Integer totalCount;
	private Integer totalPage;
	private Integer offset;
	private List<?> data;
	private Map<String, String> queryList=new HashMap<String,String>();

	public Integer getPageNow() {
		return this.pageNow;
	}
	public void setPageNow(Integer pageNow) {
		this.pageNow = pageNow;
	}
	public Integer getPageSize() {
		return this.pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalCount() {
		return this.totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getTotalPage() {
		return this.totalCount%this.pageSize==0?this.totalCount/this.pageSize:this.totalCount/this.pageSize+1;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public Integer getOffset() {
		return (this.pageNow-1)*this.pageSize;
	}
	public void setOffset(Integer offset) {
		this.offset = offset;
	}
	public List<?> getData() {
		return this.data;
	}
	public void setData(List<?> data) {
		this.data = data;
	}
	public Map<String, String> getQueryList() {
		return this.queryList;
	}
	public void setQueryList(Map<String, String> queryList) {
		this.queryList = queryList;
	}
	@Override
	public String toString() {
		return "Pager [pageNow=" + this.pageNow + ", pageSize=" + this.pageSize + ", totalCount=" + this.totalCount
				+ ", totalPage=" + this.totalPage + ", offset=" + this.offset + ", data=" + this.data + ", queryList="
				+ this.queryList + "]";
	}





}
