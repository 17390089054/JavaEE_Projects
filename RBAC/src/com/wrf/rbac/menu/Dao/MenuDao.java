package com.wrf.rbac.menu.Dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.wrf.rbac.menu.Model.Menu;
@Repository
public interface MenuDao {
	/**
	 * 通过角色ID查询子菜单列表
	 * @param roleId
	 * @return ArrayList<Menu>
	 */
	public ArrayList<Menu> selectChildMenuListByRoleId(int roleId);
	/**
	 * 通过角色ID查询父菜单列表
	 * @param roleId
	 * @return  ArrayList<Menu>
	 */
	public ArrayList<Menu> selectParentMenuListByRoleId(int roleId);
	/**
	 * 查询角色拥有的子菜单列表
	 * @param roleId
	 * @return ArrayList<Menu>
	 */
	public ArrayList<Menu> selectIncludeChildMenuListByRoleId(int roleId);
	/**
	 * 查询角色未拥有的菜单列表
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
	 * 查询所有子菜单列表
	 * @return List<Menu>
	 */
	public List<Menu> selectAllChildMenuList();

	/**
	 * 根据角色Id删除菜单
	 * @param roleId
	 */
	public void deleteMenuByRoldId(int roleId);
	/**
	 * 角色批量添加菜单
	 * @param roleId
	 * @param menuIds
	 */
	public void addBatchMenu(@Param("roleId") int roleId,@Param("menuIds") int []menuIds);

	/**
	 * 默认为超级管理员添加菜单
	 * @param menuId
	 */
	public void addSuperAdministratorMenu(@Param("menuId")int menuId);


	/**
	 * 添加父菜单
	 * @param menu
	 */
	public void addParentMenu(Menu menu);
	/**
	 * 查询菜单名称的数量
	 * @param menuName
	 * @return int
	 */
	public int  getMenuCount(String menuName);
	/**
	 * 添加子菜单
	 * @param menu
	 */
	public void addChildMenu(Menu menu);

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
	 * 查询父菜单下的子菜单数量
	 * @param menuId
	 * @return int
	 */
	public int selectChildMenuCountByMenuId(int menuId);

	/**
	 * 根据菜单Id删除菜单
	 * @param menuId
	 */
	public void deleteMenuByMenuId(int menuId);

}
