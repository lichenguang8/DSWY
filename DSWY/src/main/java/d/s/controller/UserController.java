package d.s.controller;


import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import d.s.domain.MenuBean;
import d.s.domain.RoleBean;
import d.s.domain.UserBean;
import d.s.service.MenuService;
import d.s.service.RoleService;
import d.s.service.UserService;
import d.s.utils.PageUtil;

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
	/*------------------------------登录和刷新--------------------------------------*/
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
	/*-----------------------------退出系统-------------------------------------*/
	@RequestMapping("out.do")
	public ModelAndView out(HttpServletRequest request){
		ModelAndView model=new ModelAndView("redirect:../html/login.jsp");
		HttpSession session=request.getSession();
		session.removeAttribute("user");
		return model;
	}
	/*-----------------------------修改个人信息-------------------------------------*/
	@RequestMapping("updateUser.do")
	public ModelAndView updateUser(HttpServletRequest re,UserBean user,@RequestParam("file")MultipartFile mf){
		ModelAndView model=new ModelAndView();
		if (mf.getOriginalFilename()!=null||!"".equals(mf.getOriginalFilename())) {
			String savePath="F:/test/"+mf.getOriginalFilename();
			try {
				InputStream in= mf.getInputStream();
				OutputStream out=new FileOutputStream(savePath);
				FileCopyUtils.copy(in, out);
			} catch (Exception e) {
				e.printStackTrace();
			}
			user.setUserPicture(savePath);
		}
		userService.updateUser(user);
		HttpSession session=re.getSession();
		session.setAttribute("user", user);
		model.setViewName("redirect:../html/right.jsp");
		return model;
	}
	/*--------------修改前密码-----------*/
	@RequestMapping("ajaxOldPaddword.do")
	@ResponseBody
	public String ajaxOldPaddword(UserBean userBean){
		UserBean oldPasswrod = userService.oldPasswrod(userBean);
		if (oldPasswrod==null) {
			return "no";
		}else{
			return "ok";
		}
	}
	/*--------------------------密码修改--------------------*/
	@RequestMapping("updatePassword.do")
	public void updatePassword(HttpServletResponse response,HttpServletRequest re,UserBean userBean)
	{
		userService.updateUser(userBean);
		ModelAndView mav=new ModelAndView("../html/login.jsp");
		HttpSession session = re.getSession();
		session.removeAttribute("user");
		
		Cookie cookie2=new Cookie("userPassword", userBean.getUserPassword());
		cookie2.setMaxAge(0);
		cookie2.setPath("/");
		Cookie cookie3=new Cookie("maxDay","0");
		cookie3.setMaxAge(0);
		cookie3.setPath("/");

		response.addCookie(cookie2);
		response.addCookie(cookie3);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<script type='text/javascript'>window.top.location='../html/login.jsp'</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return;
	}
	/*----------------------------用户管理列表-----------*/
	@RequestMapping("selectUser.do")
	public ModelAndView selectUser(String userName,String roleName,@RequestParam(value = "pageNum", defaultValue = "1")int pageNum){
		List<RoleBean> roleBeans=roleService.listRole();
		ModelAndView mav=new ModelAndView("../html/resource/demo2/list.jsp");
		Map<String,Object> keys=new HashMap<String, Object>();
		keys.put("userName", userName);
		keys.put("roleName", roleName);
		
		/*PageUtil page=new PageUtil();
		page.setPageNum(pageNum);
		keys.put("start", page.getStart());
		keys.put("pageRows", page.getPageRows());*/
		List<UserBean> userBeans=userService.listUser(keys);	
		mav.addObject("roles", roleBeans);
		mav.addObject("userBeans",userBeans);
		return mav;
	}
	@RequestMapping("getById.do")
	public ModelAndView getByIdUser(UserBean user){
		UserBean userBean=userService.findUserId(user);
		ModelAndView model=new ModelAndView("../html/resource/demo2/view.jsp");
		model.addObject("user", userBean);
		return model;
		
	}
}
