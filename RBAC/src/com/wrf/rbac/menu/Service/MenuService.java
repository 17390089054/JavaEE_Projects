package com.wrf.rbac.menu.Service;

import java.util.ArrayList;
import java.util.List;

import com.wrf.rbac.menu.Model.Menu;

public interface MenuService {
	/**
	 * 通过角色ID查询子菜单列表
	 * @param roleId
	 * @return ArrayList<Menu>
	 */
	public ArrayList<Menu> selectChildMenuListByRoleId(Integer roleId);
	/**
	 * 通过角色ID查询父菜单列表
	 * @param roleId
	 * @return  ArrayList<Menu>
	 */
	public ArrayList<Menu> selectParentMenuListByRoleId(Integer roleId);
	/**
	 * 查询角色拥有的子菜单列表
	 * @param roleId
	 * @return ArrayList<Menu>
	 */
	public ArrayList<Menu> selectIncludeChildMenuListByRoleId(int roleId);
	/**
	 * 查询角色未拥有的子菜单列表
	 * @param roleId
	 * @return ArrayList<Menu>
	 */
	public ArrayList<Menu> selectExcludeChildMenuListByRoleId(int roleId);
	/**
	 * 查询所有的父菜单
	 * @param roleId
	 * @return ArrayList<Menu>
	 */
	public ArrayList<Menu> selectAllParentMenuList();
	/**
	 * 角色权限分配
	 * @param roleId
	 * @param menuIds
	 */
	public void distribute(int roleId,int [] menuIds);

	/**
	 * 查询所有子菜单列表
	 * @return List<Menu>
	 */
	public List<Menu>selectAllChildMenuList();
	/**
	 * 添加父菜单
	 * @param menu
	 */
	public void addParentMenu(Menu menu);
	/**
	 * 校验菜单名称是否唯一
	 * @param menuName
	 */
	public void isMenuNameUnique(String menuName);
	/**
	 * 添加子菜单
	 * @param menu
	 */
	public void addChildMenu(Menu menu);

	/**
	 * 添加超级管理员菜单
	 * @param menuId
	 */
	public void addSuperAdministratorMenu(int menuId);


	/**
	 * 根据菜单名称查询菜单项
	 * @param menuId
	 * @return Menu
	 */

	public Menu selectMenuByMenuId(int menuId);

	/**
	 * 更新子菜单
	 * @param menu
	 */
	public void updateChild(Menu menu);
	/**
	 * 更新父菜单
	 * @param menu
	 */
	public void updateParent(Menu menu);
	/**
	 * 根据菜单Id删除菜单
	 * @param menuId
	 */
	public void deleteMenuByMenuId(int menuId);

}
