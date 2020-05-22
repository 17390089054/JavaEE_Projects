package com.wrf.shop.sys.model;

/**
 @ClassName User
 * @Description 用户类
 * @Author invincible
 * @Date 2018年2月13日 下午7:51:57
 */
public class User {
	private Integer user_id;//用户id
	private String account;//用户账号
	private String password;//用户密码
	private String user_tel;//用户电话
	private String user_name;//用户昵称
	private String user_email;//用户email
	private String user_photo;//用户照片
	private String user_create_time;//用户创建时间
	private String user_sex;//用户性别
	private Integer user_status;//用户状态
	private Integer user_role_id;//用户关联角色表id
	private String role_name;//用户关联角色名称
	//构造函数
	public User(){
		
	}
	public User(Integer user_id,String account,String password,String user_tel,String user_name,
	String user_email,String user_photo,String user_create_time,String user_sex,
	Integer user_status,Integer user_role_id){
		
	}

	
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_photo() {
		return user_photo;
	}
	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}
	public String getUser_create_time() {
		return user_create_time;
	}
	public void setUser_create_time(String user_create_time) {
		this.user_create_time = user_create_time;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public Integer getUser_status() {
		return user_status;
	}
	public void setUser_status(Integer user_status) {
		this.user_status = user_status;
	}
	public Integer getUser_role_id() {
		return user_role_id;
	}
	public void setUser_role_id(Integer user_role_id) {
		this.user_role_id = user_role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", account=" + account + ", password=" + password + ", user_tel=" + user_tel
				+ ", user_name=" + user_name + ", user_email=" + user_email + ", user_photo=" + user_photo
				+ ", user_create_time=" + user_create_time + ", user_sex=" + user_sex + ", user_status=" + user_status
				+ ", user_role_id=" + user_role_id + ", role_name=" + role_name + "]";
	}
	

}
