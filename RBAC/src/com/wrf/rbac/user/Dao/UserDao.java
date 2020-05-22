package com.wrf.rbac.user.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.wrf.rbac.common.Model.Pager;
import com.wrf.rbac.user.Model.User;
@Repository
public interface UserDao {
	/**
	 * 用户登录方法
	 * @param account
	 * @param password
	 * @return com.wrf.rbac.user.Model.User
	 */
	public User login(@Param("account")String account,@Param("password")String password);
	/**
	 * 查询用户分页列表
	 * @param pager
	 * @return List<User>
	 */
	public List<User> selectUserPageList (Pager pager);
	/**
	 * 查询用户总数量
	 *  @param pager
	 * @return int
	 */
	public int selectUserCount (Pager pager);
	/**
	 *用户添加
	 * @param user
	 */
	public void add(User user);

	/**
	 * 查询账号数量
	 * @param account
	 * @return int
	 */
	public int getAccountCount(String account);
	/**
	 * 通过用户ID查询角色信息
	 * @param userId
	 * @return User
	 */
	public User selectUserByUserId(Integer userId);
	/**
	 * 更新用户信息
	 * @param user
	 */
	public void update(User user);
	/**
	 *修改用户状态(删除,禁用，激活)
	 * @param userStatus
	 * @param userId
	 */
	public void reviseUserStatus(@Param("userStatus")Integer userStatus,@Param("userId")Integer userId);
	/**
	 * 更新用户头像
	 * @param userPhoto
	 * @param userId
	 */
	public void updateUserPhoto(@Param("userPhoto") String userPhoto,@Param("userId")Integer userId);

}
