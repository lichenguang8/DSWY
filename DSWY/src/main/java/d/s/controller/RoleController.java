package d.s.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



import d.s.domain.RoleBean;
import d.s.service.RoleService;

@Controller
@RequestMapping("role")
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	/*@RequestMapping("listRole.do")
	public ModelAndView listRole(RoleBean roles){
		ModelAndView model=new ModelAndView();
		model.setViewName("redirect:../html/");
		return model;
	}*/
	@RequestMapping("selectRole.do")
	public ModelAndView findRole(RoleBean roleBean){
		ModelAndView mav=new ModelAndView("../html/resource/demo3/list.jsp");
		if (roleBean==null) {
			roleBean=new RoleBean();
		}	
		if (roleBean.getRoleState()!=null&&roleBean.getRoleState() == -1) {
			roleBean.setRoleState(null);
		}
		Integer max=roleService.max(roleBean);
		List<RoleBean> roleBeans= roleService.findRole(roleBean);
		mav.addObject("roleBeans",roleBeans);
		mav.addObject("roleName",roleBean.getRoleName());
		mav.addObject("roleState",roleBean.getRoleState());
		mav.addObject("roleId",roleBean.getRoleId());
		
		mav.addObject("maxSize",max);
		mav.addObject("pageNum", (int)Math.ceil(max/8.0));
		mav.addObject("currentPage", roleBean.getCurrentNum());
		return mav;
	}
	@RequestMapping("getRoleId.do")
	public ModelAndView getRoleId(Integer roleId){
		RoleBean role=roleService.getRoleId(roleId);
		ModelAndView mav=new ModelAndView("../html/resource/demo3/view.jsp");
		mav.addObject("role", role);
		return mav;
	}
	
	
	@RequestMapping("noDeleteRole.do")
	public ModelAndView noDeleteRole(Integer  roleId){
		RoleBean roleBean = roleService.getRoleId(roleId);
		roleBean.setRoleState(0);
	/*	List<Integer> menu=new ArrayList<Integer>();*/
		roleService.updateRole(roleBean);
		return findRole(null);
	}
	
	
	@RequestMapping("deleteRole.do")
	public ModelAndView deleteRole(Integer  roleId){
		roleService.deleteRole(roleId);
		return findRole(null);
	}
	@RequestMapping("deleteRoleAll.do")
	public ModelAndView deleteRoleAll(Integer[] ids){
		for (int i = 0; i < ids.length; i++) {
			roleService.deleteRole(ids[i]);
		}
		return findRole(null);
	}
	
	@RequestMapping("addRole.do")
	public ModelAndView addRole(Integer roleId){
		
		ModelAndView mav=new ModelAndView("../html/resource/demo3/add.jsp");
		if (roleId==null) {
		}else{
			mav.addObject("roleBean",roleService.getRoleId(roleId));
		}	
		return mav;
	}
	@RequestMapping("updateRole.do")
	public ModelAndView updateRole(Integer roleId){
		RoleBean roleBean=roleService.getRoleId(roleId);
		ModelAndView model=new ModelAndView("../html/resource/demo3/update.jsp");
		model.addObject("roleBean", roleBean);
		return model;
	}
	/*----------------------添加修改菜单项--------------*/
	@RequestMapping("insertRole.do")
	public ModelAndView insertRole(RoleBean roleBean,@RequestParam(value="menu",required=false)List<Integer> menu){
		if(menu==null){
			menu=new ArrayList<Integer>();
		}	
		roleService.insertRole(roleBean);
		return findRole(null);
	}
	@RequestMapping("updateM.do")
	public ModelAndView updateM(RoleBean roleBean,@RequestParam(value="menu",required=false)List<Integer> menu){
		if(menu==null){
			menu=new ArrayList<Integer>();
		}	
		roleService.insertRole(roleBean);
		return findRole(null);
	}
	
	
}
