package com.wrf.rbac.user.Controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wrf.rbac.common.Controller.BaseController;
import com.wrf.rbac.common.Model.Pager;
import com.wrf.rbac.role.Service.RoleService;
import com.wrf.rbac.user.Model.User;
import com.wrf.rbac.user.Service.UserService;

@Controller
@RequestMapping("/sys/user")
public class UserController extends BaseController{
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	/**
	 * 用户列表
	 * @param pager
	 * @param model
	 * @return
	 */
	@GetMapping("/list")
	public String list(Pager pager,Model model){
		//查询分页信息
		model.addAttribute(this.userService.find(pager));
		//查询角色列表
		model.addAttribute("roleList",this.roleService.selectRoleEnableList());
		return "view/sys/user/list";
	}

	/**
	 *	用户添加页面
	 * @param model
	 * @return view/sys/user/add
	 */
	@GetMapping("/add")
	public String add(Model model){
		model.addAttribute("roleList", this.roleService.selectRoleEnableList());
		return "view/sys/user/add";
	}

	/**
	 * 用户添加
	 * @param user
	 * @return /sys/user/list
	 */
	@PostMapping("/add")
	public String add(User user){
		this.userService.add(user);
		return "redirect:/sys/user/list";
	}

	/**
	 * 验证账号唯一性
	 * @param account
	 * @return  Map<String,Object>
	 */
	@GetMapping("/validAccountUnique")
	@ResponseBody
	public Map<String,Object> validAccountUnique(String account){
		Map<String,Object> map=new HashMap<String,Object>();
		try{
			this.userService.validAccountUnique(account);
			map.put("flag", true);
		}catch(Exception e){
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 用户修改页面
	 * @param userId
	 * @param model
	 * @return
	 */
	@GetMapping("/update/{userId}")
	public String update(@PathVariable Integer userId,Model model){
		model.addAttribute("roleList", this.roleService.selectRoleEnableList());
		model.addAttribute(this.userService.load(userId));
		return "view/sys/user/update";
	}
	/**
	 * 修改用户页面
	 * @param user
	 * @return /sys/user/list
	 */
	@PutMapping("/update")
	public String update(User user){
		this.userService.update(user);
		return "redirect:/sys/user/list";

	}

	/**
	 * 用户删除
	 * @param userStatus
	 * @param userId
	 * @return Map<String,Object>
	 */
	@DeleteMapping(value={"/delete"})
	@ResponseBody
	public Map<String,Object> delete(Integer userStatus,Integer userId ){
		Map<String,Object>map=new HashMap<String,Object>();
		try{
			this.userService.deleteOrActive(userStatus, userId);
			map.put("flag", true);
		}catch(Exception e){
			map.put("msg",e.getMessage());
		}
		return map;
	}

	/**
	 * 用户上传页面
	 * @param userId
	 * @param model
	 * @return view/sys/user/photo
	 */
	@GetMapping("/photo")
	public String photo(Integer userId,Model model){
		model.addAttribute(this.userService.load(userId));
		return "view/sys/user/photo";
	}
	/**
	 * 文件上传
	 * @param userId
	 * @param myfile
	 * @param model
	 * @return view/sys/user/photo
	 */
	@PostMapping("/photo")
	public String photo(Integer userId,MultipartFile myfile,Model model){
		try {
			//1.获取上传文件名
			String fileName = myfile.getOriginalFilename();
			//2.获取服务器绝对路径
			String path = this.application.getRealPath("resource/photo");
			//3.建立文件对象
			File file=new File(path);
			//4.判断文件是否存在 不存在则创建
			if(!file.exists()) {
				file.mkdirs();
			}
			//5.获取文件后缀名
			String ext=FilenameUtils.getExtension(fileName);
			//6.创建新的文件名
			String newFileName=UUID.randomUUID().toString().replaceAll("-", "")+"."+ext;
			//7.上传文件
			myfile.transferTo(new File(path+"/"+newFileName));
			//8.存入数据库
			this.userService.updateUserPhoto(newFileName, userId);
			//9.返回至前台
			model.addAttribute("message","更新用户头像成功!");

		} catch (Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message","更新用户头像失败!");
		}
		return "view/message";
	}


}
