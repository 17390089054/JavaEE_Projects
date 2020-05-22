package com.wrf.rbac.user.Model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.wrf.rbac.role.Model.Role;
public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	/**
	 *用户实体Bean
	 */
	private Integer userId;//用户ID
	private String account;//账号
	private String password;//密码
	private String userName;//姓名
	private String userSex;//性别
	private Integer userAge;//年龄
	private String userPhoto;//用户头像
	private Integer userStatus;//用户状态
	private Integer userRoleId;//用户关联角色ID
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date userCreateTime;//用户创建时间
	private Role role;//角色对象

	public Integer getUserId() {
		return this.userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getAccount() {
		return this.account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return this.password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return this.userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserSex() {
		return this.userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public Integer getUserAge() {
		return this.userAge;
	}
	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}
	public Integer getUserStatus() {
		return this.userStatus;
	}
	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}
	public Integer getUserRoleId() {
		return this.userRoleId;
	}
	public void setUserRoleId(Integer userRoleId) {
		this.userRoleId = userRoleId;
	}
	public Date getUserCreateTime() {
		return this.userCreateTime;
	}
	public void setUserCreateTime(Date userCreateTime) {
		this.userCreateTime = userCreateTime;
	}
	public Role getRole() {
		return this.role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public String getUserPhoto() {
		return this.userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	@Override
	public String toString() {
		return "User [userId=" + this.userId + ", account=" + this.account + ", password=" + this.password
				+ ", userName=" + this.userName + ", userSex=" + this.userSex + ", userAge=" + this.userAge
				+ ", userPhoto=" + this.userPhoto + ", userStatus=" + this.userStatus + ", userRoleId="
				+ this.userRoleId + ", userCreateTime=" + this.userCreateTime + ", role=" + this.role + "]";
	}

}
