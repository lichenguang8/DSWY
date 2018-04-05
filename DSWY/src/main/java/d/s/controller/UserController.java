package d.s.controller;


import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import d.s.domain.MenuBean;
import d.s.domain.RoleBean;
import d.s.domain.UserBean;
import d.s.service.MenuService;
import d.s.service.RoleService;
import d.s.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private RoleService roleService;
	
	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	/*------------------------------登录--------------------------------------*/
	@RequestMapping("user.do")
	public ModelAndView login(HttpServletRequest request,UserBean user,HttpServletResponse response, Integer cookie){
		UserBean s =userService.findUser(user);
		ModelAndView model =new ModelAndView();
		HttpSession session=request.getSession();
		if(s==null){
			return out(request);
		}else{
			List<RoleBean> r=(List<RoleBean>) s.getRoleBean();
			for(RoleBean role:r){
				Integer id=role.getRoleId();
				List<MenuBean> menus=menuService.findMenu(id);
				System.out.println(menus);
				session.setAttribute("menus", menus);
			}
			session.setAttribute("user", s);
			if(cookie!=null){
			Cookie cookie1=new Cookie("userLogin", user.getUserLogin());
			cookie1.setMaxAge(60*60*24*cookie);
			cookie1.setPath("/");
			Cookie cookie2=new Cookie("userPassword",user.getUserPassword());
			cookie2.setMaxAge(60*60*24*cookie);
			cookie2.setPath("/");
			Cookie cookie3=new Cookie("maxAge",cookie.toString());
			cookie3.setMaxAge(60*60*24*cookie);
			cookie3.setPath("/");
			response.addCookie(cookie1);
			response.addCookie(cookie2);
			response.addCookie(cookie3);
			}
		}
		model.setViewName("../html/main.jsp");
		return model;
	}
	/*------------------------------刷新--------------------------------------*/
	@RequestMapping("userId.do")
	public ModelAndView login(HttpServletRequest request,Integer userId){
		UserBean users=userService.findUserId(userId);
		System.out.println(users);
		if(users==null){
			return out(request);
		}
		ModelAndView model =new ModelAndView();
		HttpSession session=request.getSession();
		session.setAttribute("user", users);
		model.setViewName("redirect:../html/main.jsp");
		return model;
	}
	/*-----------------------------退出系统-------------------------------------*/
	@RequestMapping("out.do")
	public ModelAndView out(HttpServletRequest request){
		ModelAndView model=new ModelAndView("redirect:../html/login.jsp");
		HttpSession session=request.getSession();
		session.removeAttribute("user");
		return model;
	}
	
}
