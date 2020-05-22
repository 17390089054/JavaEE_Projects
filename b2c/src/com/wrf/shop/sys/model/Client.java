package com.wrf.shop.sys.model;

/**
 @ClassName Client
 * @Description  客户Bean
 * @Author invincible
 * @Date 2018年2月28日 上午11:50:24
 */
public class Client {
		private Integer c_id;
		private String c_name;
		private String c_photo;
		private String c_account;
		private String c_password;
		private String c_create_time;
		private String c_birthday;
		private String c_tel;
		private String c_sex;
		public Integer getC_id() {
			return c_id;
		}
		public void setC_id(Integer c_id) {
			this.c_id = c_id;
		}
		public String getC_name() {
			return c_name;
		}
		public void setC_name(String c_name) {
			this.c_name = c_name;
		}
		public String getC_photo() {
			return c_photo;
		}
		public void setC_photo(String c_photo) {
			this.c_photo = c_photo;
		}
		public String getC_account() {
			return c_account;
		}
		public void setC_account(String c_account) {
			this.c_account = c_account;
		}
		public String getC_password() {
			return c_password;
		}
		public void setC_password(String c_password) {
			this.c_password = c_password;
		}
		public String getC_create_time() {
			return c_create_time;
		}
		public void setC_create_time(String c_create_time) {
			this.c_create_time = c_create_time;
		}
		public String getC_birthday() {
			return c_birthday;
		}
		public void setC_birthday(String c_birthday) {
			this.c_birthday = c_birthday;
		}
		public String getC_tel() {
			return c_tel;
		}
		public void setC_tel(String c_tel) {
			this.c_tel = c_tel;
		}
		public String getC_sex() {
			return c_sex;
		}
		public void setC_sex(String c_sex) {
			this.c_sex = c_sex;
		}
		@Override
		public String toString() {
			return "Client [c_id=" + c_id + ", c_name=" + c_name + ", c_photo=" + c_photo + ", c_account=" + c_account
					+ ", c_password=" + c_password + ", c_create_time=" + c_create_time + ", c_birthday=" + c_birthday
					+ ", c_tel=" + c_tel + ", c_sex=" + c_sex + "]";
		}
}
