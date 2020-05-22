package com.wrf.rbac.common.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.wrf.rbac.common.Util.Constants;
import com.wrf.rbac.menu.Dao.MenuDao;
import com.wrf.rbac.user.Model.User;
import com.wrf.rbac.user.Service.UserService;

@Controller
public class MainController extends BaseController {
	@Autowired
	private UserService userService;
	@Autowired
	private MenuDao menuDao;
	/**
	 * 登录页面跳转
	 * @return /view/sys/login
	 */
	@GetMapping({"/sys/login","/"})
	public String login() {
		return "/view/sys/login";
	}

	/**
	 * 用户登录
	 * @param account
	 * @param password
	 * @param model
	 * @return /sys/index
	 */
	@PostMapping("/sys/login")
	public String login(String account, String password, String inputCode,Model model) {
		try {
			//验证验证码是否正确 302FOUND
			//System.out.println("sessionCode:"+this.session.getAttribute(Constants.RANDOMCODEKEY).toString());
			//System.out.println("inputCode:"+inputCode);
			if (inputCode.toUpperCase().equals(this.session.getAttribute(Constants.RANDOMCODEKEY).toString().toUpperCase())){
				// 验证
				User user = this.userService.login(account, password);
				// 存入Session
				this.session.setAttribute(Constants.SESSION_USER, user);

				// 跳转
				return "redirect:/sys/index";
			}else{
				model.addAttribute("msg", "验证码输入有误!");
				model.addAttribute("account", account);
				return "/view/sys/login";
			}



		} catch (Exception e) {
			//e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("account", account);
			return "/view/sys/login";
		}
	}


	/**
	 * 跳转到主页
	 * @return /view/sys/index
	 */
	@GetMapping("/sys/index")
	public String index(Model model) {
		//1.获取用户Session
		User user=(User) this.session.getAttribute(Constants.SESSION_USER);
		//2.获取角色ID
		Integer userRoleId=user.getUserRoleId();
		//3.查询子菜单列表
		model.addAttribute("childMenuList", this.menuDao.selectChildMenuListByRoleId(userRoleId));
		//4.查询父菜单列表
		model.addAttribute("parentMenuList", this.menuDao.selectParentMenuListByRoleId(userRoleId));

		return "/view/sys/index";
	}
	/**
	 * 退出系统
	 * @return redirect:/sys/login
	 */
	@GetMapping("/sys/logout")
	public String logout(){
		this.session.invalidate();
		return "redirect:/sys/login";
	}








}
