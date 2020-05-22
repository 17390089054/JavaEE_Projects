package com.wrf.rbac.user.Service;

import com.wrf.rbac.common.Model.Pager;
import com.wrf.rbac.user.Model.User;

public interface UserService {
	/**
	 *	用户登录方法
	 * @param account
	 * @param password
	 * @return com.wrf.rbac.user.Model.User
	 */
	public User login(String account,String password);
	/**
	 * 查询用户分页信息并返回
	 * @param pager
	 * @return Pager
	 */
	public Pager find (Pager pager);
	/**
	 * 用户添加
	 * @param user
	 */
	public void add(User user);
	/**
	 * 验证账号唯一性
	 * @param account
	 */
	public void validAccountUnique(String account);
	/**
	 * 加载用户数据
	 * @param userId
	 * @return User
	 */
	public User load(Integer userId);
	/**
	 * 更新用户信息
	 * @param user
	 */
	public void update(User user);
	/**
	 *	删除或者激活
	 * @param userStatus
	 * @param userId
	 */
	public void deleteOrActive(Integer userStatus,Integer userId);
	/**
	 * 更新用户头像
	 * @param userPhoto
	 * @param userId
	 */
	public void updateUserPhoto(String userPhoto,Integer userId);

}
