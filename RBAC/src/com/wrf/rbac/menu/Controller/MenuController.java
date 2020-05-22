package com.wrf.rbac.menu.Controller;

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
import com.wrf.rbac.menu.Model.Menu;
import com.wrf.rbac.menu.Service.MenuService;
@Controller
@RequestMapping("/sys/menu")
public class MenuController extends BaseController {
	@Autowired
	private MenuService menuService;

	/**
	 * 菜单列表界面
	 * @param model
	 * @return /view/sys/menu/list
	 */
	@GetMapping("/list")
	public String list(Model model){
		model.addAttribute("parentMenuList",this.menuService.selectAllParentMenuList());
		model.addAttribute("childMenuList",this.menuService.selectAllChildMenuList());
		return "/view/sys/menu/list";
	}

	/**
	 * 跳转到添加父菜单页面
	 * @return /view/sys/menu/addParent
	 */
	@GetMapping("/addParent")
	public String addParent(){
		return "/view/sys/menu/addParent";
	}

	/**
	 * 父菜单添加
	 * @param menu
	 * @param model
	 * @return
	 */
	@PostMapping("/addParent")
	public String addParent(Menu menu,Model model){
		try {
			this.menuService.addParentMenu(menu);
			return "redirect:/sys/menu/list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "/view/sys/menu/addParent";
		}
	}

	/**
	 * 校验菜单名称是否重复
	 * @param menuName
	 * @return Map<String,Object>
	 */
	@GetMapping("/isMenuNameUnique")
	@ResponseBody
	public Map<String,Object> isMenuUnique (String menuName){
		Map<String,Object>map=new HashMap<>();
		try{
			this.menuService.isMenuNameUnique(menuName);
			map.put("flag", true);
		}catch (Exception ex) {
			// TODO: 如何处理
			map.put("msg", ex.getMessage());
		}
		return map;
	}

	/**
	 * 添加子菜单页面
	 * @param model
	 * @return /sys/menu/addChild
	 */
	@GetMapping("/addChild")
	public String addChild(Model model){
		model.addAttribute("parentMenuList", this.menuService.selectAllParentMenuList());
		return "/view/sys/menu/addChild";
	}


	/**
	 * 子菜单添加
	 * @param menu
	 * @param model
	 * @return /view/sys/menu/addChild
	 */
	@PostMapping("/addChild")
	public String addChild(Menu menu,Model model){
		try {
			this.menuService.addChildMenu(menu);
			return "redirect:/sys/menu/list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "/view/sys/menu/addChild";
		}
	}

	/**
	 * 跳转到子菜单编辑页面
	 * @param menuId
	 * @param model
	 * @return /view/sys/menu/edit
	 */
	@GetMapping("/updateChild")
	public String updateChild(int menuId,Model model){
		model.addAttribute("parentMenuList",this.menuService.selectAllParentMenuList());
		model.addAttribute("menu", this.menuService.selectMenuByMenuId(menuId));
		return "/view/sys/menu/updateChild";
	}

	/**
	 * 子菜单编辑页面
	 * @param menu
	 * @param model
	 * @return /sys/menu/list
	 */
	@PutMapping("/updateChild")
	public String updateChild(Menu menu,Model model){
		try {
			this.menuService.updateChild(menu);
			return "redirect:/sys/menu/list";
		} catch (Exception ex) {
			model.addAttribute("message",ex.getMessage());
			return "/view/message";
		}
	}

	/**
	 * 跳转到父菜单编辑页面
	 * @param menuId
	 * @param model
	 * @return /view/sys/menu/edit
	 */
	@GetMapping("/updateParent")
	public String updateParent(int menuId,Model model){
		model.addAttribute("menu", this.menuService.selectMenuByMenuId(menuId));
		return "/view/sys/menu/updateParent";
	}

	/**
	 * 父菜单编辑页面
	 * @param menu
	 * @param model
	 * @return /sys/menu/list
	 */
	@PutMapping("/updateParent")
	public String updateParent(Menu menu,Model model){
		try {
			this.menuService.updateParent(menu);
			return "redirect:/sys/menu/list";
		} catch (Exception ex) {
			model.addAttribute("message",ex.getMessage());
			return "/view/message";
		}
	}

	@DeleteMapping("/delete")
	@ResponseBody
	public Map<String,Object> delete(int menuId){
		Map<String,Object>map=new HashMap<>();
		try{
			this.menuService.deleteMenuByMenuId(menuId);
			map.put("flag", true);
		}catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}




}
