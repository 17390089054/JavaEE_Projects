package com.wrf.rbac.user.Service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wrf.rbac.common.Exception.ServiceException;
import com.wrf.rbac.common.Model.Pager;
import com.wrf.rbac.user.Dao.UserDao;
import com.wrf.rbac.user.Model.User;
import com.wrf.rbac.user.Service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public User login(String account, String password) {
		User user = this.userDao.login(account.trim(), password.trim());
		if (user == null) {
			throw new RuntimeException("账号或密码错误!");
		} else if (user.getUserStatus() == 0) {
			throw new RuntimeException("账号不可用,请联系管理员!");
		} else if (user.getUserRoleId() == 0 || user.getUserRoleId() == null) {
			throw new RuntimeException("尚未分配角色,请联系管理员!");
		} else {
			return user;
		}
	}

	@Override
	public Pager find(Pager pager) {
		pager.setData(this.userDao.selectUserPageList(pager));
		pager.setTotalCount(this.userDao.selectUserCount(pager));
		return pager;
	}

	@Override
	public void add(User user) {
		try{
			this.userDao.add(user);

		}catch(Exception e){
			e.printStackTrace();//开发人员使用
			//Excption编译异常转化为运行异常
			throw new ServiceException("用户添加失败");//用户反馈信息
		}
	}

	@Override
	public void validAccountUnique(String account) {
		int count=this.userDao.getAccountCount(account);
		if(count>0){
			throw new ServiceException("该账号已被注册，请重新填写!");
		}
	}

	@Override
	public User load(Integer userId) {
		return this.userDao.selectUserByUserId(userId);
	}

	@Override
	public void update(User user) {
		try{
			this.userDao.update(user);
		}catch(Exception e){
			e.printStackTrace();
			throw new ServiceException("更新用户信息失败!");
		}
	}

	@Override
	public void deleteOrActive(Integer userStatus, Integer userId) {
		try {
			this.userDao.reviseUserStatus(userStatus, userId);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new ServiceException("修改用户状态失败！");
		}

	}

	@Override
	public void updateUserPhoto(String userPhoto, Integer userId) {
		try{
			this.userDao.updateUserPhoto(userPhoto, userId);
		}catch(Exception e){
			e.printStackTrace();
			throw new ServiceException("更新用户头像失败!");
		}
	}

}
