package com.wrf.rbac.role.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.wrf.rbac.role.Model.Role;
@Repository
public interface RoleDao {
	/**
	 * 查询可用角色列表
	 * @return List<Role>
	 */
	public List<Role>selectRoleEnableList();
	/**
	 *	查询所有角色列表
	 * @return List<Role>
	 */
	public List<Role>selectRoleList();
	/**
	 * 角色新增
	 * @param role
	 */
	public void add(Role role);
	/**
	 * 获取角色数量
	 * @param roleName
	 * @return int
	 */
	public int getRoleCount(String roleName);

	/**
	 * 更新角色信息
	 * @param role
	 */
	public void update(Role role);

	/**
	 *删除角色信息
	 * @param roleId
	 */
	public void delete(int roleId);
	/**
	 * 根据角色Id查询角色信息
	 * @param roleId
	 * @return
	 */
	public Role selectRoleByRoleId(int roleId);
	/**
	 * 查询角色关联的用户数量
	 * @param roleId
	 * @return int
	 */
	public int selectUserCountByRoleId(int roleId);

}
