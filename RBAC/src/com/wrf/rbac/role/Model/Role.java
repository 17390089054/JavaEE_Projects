package com.wrf.rbac.role.Model;

import java.io.Serializable;

public class Role  implements Serializable{
	/**
	 *角色实体Bean
	 */
	private static final long serialVersionUID = 1L;

	private Integer roleId;//角色ID
	private String roleName;//角色名称
	private String roleDesc;//角色描述信息
	private Integer roleStatus;//角色状态

	public Integer getRoleId() {
		return this.roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return this.roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleDesc() {
		return this.roleDesc;
	}
	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}
	public Integer getRoleStatus() {
		return this.roleStatus;
	}
	public void setRoleStatus(Integer roleStatus) {
		this.roleStatus = roleStatus;
	}

	@Override
	public String toString() {
		return "Role [roleId=" + this.roleId + ", roleName=" + this.roleName + ", roleDesc=" + this.roleDesc
				+ ", roleStatus=" + this.roleStatus + "]";
	}

}
