package com.wrf.shop.sys.model;

import java.util.List;

/**
 @ClassName PageBean
 * @Description  存储页面信息
 * @Author invincible
 * @Date 2018年2月17日 下午8:10:01
 */
public class PageBean {
		private int pageNow;//当前页
		private int pageSize;//每页记录数
		private int totalPage;//总页数
		private int totalCount;//总记录数
		private List<?>data;
		public int getPageNow() {
			return pageNow;
		}
		public void setPageNow(int pageNow) {
			this.pageNow = pageNow;
		}
		public int getPageSize() {
			return pageSize;
		}
		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}
		public int getTotalPage() {
			return totalPage;
		}
		public void setTotalPage() {
			this.totalPage = this.totalCount%this.pageSize==0?this.totalCount/this.pageSize:this.totalCount/this.pageSize+1;
		}
		public int getTotalCount() {
			return totalCount;
		}
		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
		}
		public List<?> getData() {
			return data;
		}
		public void setData(List<?> data) {
			this.data = data;
		}
	
		@Override
		public String toString() {
			return "PageBean [pageNow=" + pageNow + ", pageSize=" + pageSize + ", totalPage=" + totalPage
					+ ", totalCount=" + totalCount + ", data=" + data + "]";
		}
		
		
		
}
