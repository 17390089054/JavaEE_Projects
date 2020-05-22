package com.wrf.rbac.menu.Service.Impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wrf.rbac.common.Exception.ServiceException;
import com.wrf.rbac.menu.Dao.MenuDao;
import com.wrf.rbac.menu.Model.Menu;
import com.wrf.rbac.menu.Service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;

	@Override
	public ArrayList<Menu> selectChildMenuListByRoleId(Integer roleId) {
		return this.menuDao.selectChildMenuListByRoleId(roleId);
	}

	@Override
	public ArrayList<Menu> selectParentMenuListByRoleId(Integer roleId) {
		return this.menuDao.selectParentMenuListByRoleId(roleId);
	}

	@Override
	public ArrayList<Menu> selectIncludeChildMenuListByRoleId(int roleId) {
		return this.menuDao.selectIncludeChildMenuListByRoleId(roleId);
	}

	@Override
	public ArrayList<Menu> selectExcludeChildMenuListByRoleId(int roleId) {
		return this.menuDao.selectExcludeChildMenuListByRoleId(roleId);
	}

	@Override
	public ArrayList<Menu> selectAllParentMenuList() {
		return this.menuDao.selectAllParentMenuList();
	}

	@Override
	public void distribute(int roleId, int[] menuIds) {
		try{
			this.menuDao.deleteMenuByRoldId(roleId);
			if(menuIds !=null && menuIds.length>0) {
				this.menuDao.addBatchMenu(roleId, menuIds);
			}
		}catch(Exception e){
			e.printStackTrace();
			throw new ServiceException("权限分配失败");
		}

	}

	@Override
	public List<Menu> selectAllChildMenuList() {
		return this.menuDao.selectAllChildMenuList();
	}

	@Override
	public void addParentMenu(Menu menu) {
		try{
			this.menuDao.addParentMenu(menu);
		}catch(Exception e){
			throw new ServiceException("新增父菜单失败!");
		}
	}

	@Override
	public void isMenuNameUnique(String menuName) {
		int count=this.menuDao.getMenuCount(menuName);
		if(count>0){
			throw new ServiceException("菜单名称已存在!请重新填写!");
		}
	}

	@Override
	public void addChildMenu(Menu menu) {
		try{
			//添加一个子菜单
			this.menuDao.addChildMenu(menu);
			//为超级管理员添加该菜单
			this.addSuperAdministratorMenu(menu.getMenuId());
		}catch(Exception e){
			throw new ServiceException("新增子菜单失败!");
		}
	}

	@Override
	public Menu selectMenuByMenuId(int menuId) {
		return this.menuDao.selectMenuByMenuId(menuId);
	}

	@Override
	public void updateChild(Menu menu) {
		try {
			this.menuDao.updateChild(menu);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("编辑菜单失败!");
		}
	}

	@Override
	public void updateParent(Menu menu) {
		try {
			this.menuDao.updateParent(menu);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("编辑菜单失败!");
		}
	}

	@Override
	public void deleteMenuByMenuId(int menuId) {
		//查询菜单信息
		Menu menu=this.menuDao.selectMenuByMenuId(menuId);
		if(menu.getMenuParentId()!=null){//子菜单
			this.menuDao.deleteMenuByMenuId(menuId);
		}else{//父菜单
			int count=this.menuDao.selectChildMenuCountByMenuId(menuId);
			if(count>0){
				throw new ServiceException("该菜单下尚有子菜单，不可删除!");
			}else{
				this.menuDao.deleteMenuByMenuId(menuId);
			}
		}

	}

	@Override
	public void addSuperAdministratorMenu(int menuId) {
		this.menuDao.addSuperAdministratorMenu(menuId);
	}

}
