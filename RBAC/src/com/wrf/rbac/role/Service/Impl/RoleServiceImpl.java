package com.wrf.rbac.role.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wrf.rbac.common.Exception.ServiceException;
import com.wrf.rbac.role.Dao.RoleDao;
import com.wrf.rbac.role.Model.Role;
import com.wrf.rbac.role.Service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao roleDao;
	@Override
	public List<Role> selectRoleEnableList() {
		return this.roleDao.selectRoleEnableList();
	}

	@Override
	public List<Role> selectRoleList() {
		return this.roleDao.selectRoleList();
	}

	@Override
	public void add(Role role) {
		try{
			this.roleDao.add(role);
		}catch(Exception e){
			throw new ServiceException("新增角色失败!");
		}
	}

	@Override
	public void isRoleNameUnique(String roleName) {
		int count=this.roleDao.getRoleCount(roleName);
		if(count>0){
			throw new ServiceException("角色名称已存在!请重新填写!");
		}
	}

	@Override
	public void update(Role role) {
		try{
			this.roleDao.update(role);
		}catch (Exception e) {
			throw new ServiceException("更新角色信息失败!");
		}
	}


	@Override
	public Role selectRoleByRoleId(int roleId) {
		return this.roleDao.selectRoleByRoleId(roleId);
	}

	@Override
	public void deleteRole(int roleId) {
		int count=this.roleDao.selectUserCountByRoleId(roleId);
		if(count>0){
			throw new ServiceException("该角色下尚有用户，无法删除!");
		}else{
			this.roleDao.delete(roleId);
		}

	}



}
