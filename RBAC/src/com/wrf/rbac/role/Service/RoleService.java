package com.wrf.rbac.role.Service;

import java.util.List;

import com.wrf.rbac.role.Model.Role;

public interface RoleService {
	/**
	 * 查询可用角色列表
	 * @return List<Role>
	 */
	public List<Role>selectRoleEnableList();
	/**
	 * 查询角色列表
	 * @return List<Role>
	 */
	public List<Role>selectRoleList();
	/**
	 *新增角色
	 */
	public void add(Role role);

	/**
	 *	角色名称是否唯一
	 * @param roleName
	 */
	public void isRoleNameUnique(String roleName);

	/**
	 * 更新角色信息
	 * @param role
	 */
	public void update(Role role);


	/**
	 * 根据角色Id查询角色信息
	 * @param roleId
	 * @return
	 */
	public Role selectRoleByRoleId(int roleId);

	/**
	 * 查询角色下是否有用户
	 * @param roleId
	 * @return int
	 */
	public void deleteRole(int roleId);

}
