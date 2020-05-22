package com.wrf.rbac.menu.Model;

import java.io.Serializable;

public class Menu implements Serializable{

	private static final long serialVersionUID = 1L;

	private Integer menuId;
	private String menuName;
	private String  menuUrl;
	private Integer menuParentId;
	private String menuLogo;
	private Integer menuStatus;

	public Integer getMenuId() {
		return this.menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return this.menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return this.menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public Integer getMenuParentId() {
		return this.menuParentId;
	}
	public void setMenuParentId(Integer menuParentId) {
		this.menuParentId = menuParentId;
	}
	public String getMenuLogo() {
		return this.menuLogo;
	}
	public void setMenuLogo(String menuLogo) {
		this.menuLogo = menuLogo;
	}
	public Integer getMenuStatus() {
		return this.menuStatus;
	}
	public void setMenuStatus(Integer menuStatus) {
		this.menuStatus = menuStatus;
	}
	@Override
	public String toString() {
		return "Menu [menuId=" + this.menuId + ", menuName=" + this.menuName + ", menuUrl=" + this.menuUrl
				+ ", menuParentId=" + this.menuParentId + ", menuLogo=" + this.menuLogo + ", menuStatus="
				+ this.menuStatus + "]";
	}



}
