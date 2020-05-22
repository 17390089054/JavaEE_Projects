package com.wrf.rbac.role.Controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wrf.rbac.common.Controller.BaseController;
import com.wrf.rbac.menu.Service.MenuService;
import com.wrf.rbac.role.Model.Role;
import com.wrf.rbac.role.Service.RoleService;
@Controller
@RequestMapping("/sys/role")
public class RoleController extends BaseController {
	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;

	/**
	 * 角色列表页面
	 * @param model
	 * @return /view/sys/role/list
	 */
	@GetMapping("/list")
	public String list(Model model){
		model.addAttribute("roleList",this.roleService.selectRoleList());
		return "/view/sys/role/list";
	}
	/**
	 * 角色新增页面
	 * @return /view/sys/role/add
	 */
	@GetMapping("/add")
	public String add(){
		return "/view/sys/role/add";
	}

	/**
	 * 角色新增
	 * @param model
	 * @param role
	 * @return /sys/role/list
	 */
	@PostMapping("/add")
	public String add(Model model,Role role){
		try{
			this.roleService.add(role);
			return "redirect:/sys/role/list";
		}catch(Exception e){
			model.addAttribute("message",e.getMessage());
			return "/view/message";
		}
	}

	/**
	 * 验证角色唯一性
	 * @param roleName
	 * @return Map<String,Object>
	 */
	@GetMapping("/isRoleNameUnique")
	@ResponseBody
	public Map<String,Object>isRoleUnique(String roleName){
		Map<String,Object>map=new HashMap<>();
		try {
			this.roleService.isRoleNameUnique(roleName);
			map.put("flag", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 权限分配页面
	 * @return /view/sys/role/distribute
	 */
	@GetMapping("/distribute")
	public String distribute(int roleId,Model model){
		model.addAttribute("roleId", roleId);
		model.addAttribute("parentMenuList",this.menuService.selectAllParentMenuList());
		model.addAttribute("includeMenuList", this.menuService.selectIncludeChildMenuListByRoleId(roleId));
		model.addAttribute("excludeMenuList", this.menuService.selectExcludeChildMenuListByRoleId(roleId));
		return "/view/sys/role/distribute";
	}

	/**
	 * 角色权限分配
	 * @param roleId
	 * @param menuIds
	 * @return
	 */
	@PostMapping("/distribute")
	public String distribute(int roleId,int []menuIds,Model model){
		try{
			this.menuService.distribute(roleId, menuIds);
			model.addAttribute("message", "权限分配成功!");
		}catch(Exception e){
			model.addAttribute("message", e.getMessage());
		}
		return "view/message";
	}

	/**
	 *
	 * @param roleId
	 * @param model
	 * @return 跳转到角色更新页面
	 */
	@GetMapping("/update")
	public String update(int roleId,Model model){
		model.addAttribute("role", this.roleService.selectRoleByRoleId(roleId));
		return "/view/sys/role/update";
	}

	/**
	 * 编辑角色信息
	 * @param role
	 * @param model
	 * @return
	 */
	@PutMapping("/update")
	public String update(Role role,Model model){
		try {
			this.roleService.update(role);
			return "redirect:/sys/role/list";
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("role",this.roleService.selectRoleByRoleId(role.getRoleId()));
			return "/sys/role/update";
		}
	}

	@DeleteMapping("/delete")
	@ResponseBody
	public Map<String,Object>delete(int roleId){
		Map<String,Object>map=new HashMap<>();
		try {
			this.roleService.deleteRole(roleId);
			map.put("flag", true);
		} catch (Exception ex) {
			ex.printStackTrace();
			map.put("msg", ex.getMessage());
		}
		return map;
	}



}
