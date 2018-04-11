package d.s.controller;


import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
import d.s.domain.UserRoleBean;
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
				List<MenuBean> menus=menuService.getMenu(id);
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
	public ModelAndView selectUser(UserBean user){
		if (user==null) {
			user=new UserBean();
		}	
		List<RoleBean> roleBeans=roleService.listRole();
		ModelAndView mav=new ModelAndView("../html/resource/demo2/list.jsp");
		List<UserBean> userBeans=userService.listUser(user);
		Integer max=userService.max(user);
		mav.addObject("roles", roleBeans);
		mav.addObject("userBeans",userBeans);
		mav.addObject("userName",user.getUserName());
		mav.addObject("userIdentity", user.getUserIdentity());
		
		mav.addObject("maxSize",max);
		mav.addObject("pageNum", (int)Math.ceil(max/8.0));
		mav.addObject("currentPage", user.getCurrentNum());
		return mav;
	}
	@RequestMapping("getById.do")
	public ModelAndView getByIdUser(UserBean user){
		UserBean userBean=userService.findUserId(user);
		ModelAndView model=new ModelAndView("../html/resource/demo2/view.jsp");
		model.addObject("user", userBean);
		return model;
		
	}
	/*-----------------------------添加用户-------------------------*/
	@RequestMapping("addUser.do")
	public ModelAndView addUser(String type,Integer userId){
		UserBean user=new UserBean();
		user.setUserId(userId);
		UserBean userBean=userService.findUserId(user);
		List<RoleBean> roleBeans=roleService.listRole();
		ModelAndView model=new ModelAndView("../html/resource/demo2/update.jsp");
		if (type==null||"".equals(type)) {
			model.setViewName("../html/resource/demo2/add.jsp");
		}else if("add".equals(type)) {
			
		}else if("update".equals(type)) {
			model.addObject("user", userBean);
		}
		model.addObject("roles", roleBeans);
		return model;
	}
	@RequestMapping("insertUser.do")
	public ModelAndView insertUser(UserBean userBean){
		userService.insertUser(userBean);
		ModelAndView model =new ModelAndView("redirect:./selectUser.do");
		return model;
		
	}
	/*------------------------删除--------------------*/
	@RequestMapping("deleteUserAll.do")
	public ModelAndView deleteUserAll(Integer[] ids){
		for (int i = 0; i < ids.length; i++) {
			userService.deleteUser(ids[i]);
		}
		return selectUser(null);
	}
	
	@RequestMapping("noDeleteUser.do")
	public ModelAndView noDeleteUser(Integer userId){
		UserBean userBean = userService.getUserById(userId);
		userBean.setUserState(0);
		userService.updateUser(userBean);
		return selectUser(null);
	}
	@RequestMapping("yesDeleteUser.do")
	public ModelAndView yesDeleteUser(Integer userId){
		UserBean userBean = userService.getUserById(userId);
		userBean.setUserState(1);
		userService.updateUser(userBean);
		return selectUser(null);
	}
	@RequestMapping("excl.do")
	public void excel(Integer[] ids, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		// 创建excel表头部分
		String[] excelHeader = { "用户编号", "用户姓名", "用户名","密码", "电话", "邮箱", "身份证号",
				"状态", "备注" };
		// 创建集合（从数据库中查询出来）

		List<UserBean> list = new ArrayList<UserBean>();
		UserBean userBean = null;

		
		for (int i = 0; i < ids.length; i++) {
			userBean =userService.getUserById(ids[i]);
			list.add(userBean);
		}
		System.out.println(list.size());
		// 创建Excel对象
		HSSFWorkbook wb = new HSSFWorkbook();
		// 创建sheet
		HSSFSheet sheet = wb.createSheet("用户信息");
		// sheet.createFreezePane(1, 3); 冻结
		// 设置列宽
		sheet.setColumnWidth(0, 3500);
		sheet.setColumnWidth(1, 3500);
		sheet.setColumnWidth(2, 3500);
		sheet.setColumnWidth(3, 5000);
		sheet.setColumnWidth(4, 3500);
		sheet.setColumnWidth(5, 3500);
		sheet.setColumnWidth(6, 3500);
		sheet.setColumnWidth(7, 3500);
		sheet.setColumnWidth(8, 3500);

		

		// 创建行（第一行表头）
		HSSFRow row = sheet.createRow((int) 0);
		// 创建样式
		HSSFCellStyle style = wb.createCellStyle();
		// 居中
		
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		HSSFFont headfont = wb.createFont();
		headfont.setFontName("黑体");
		headfont.setFontHeightInPoints((short) 15);// 字体大小
		headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 加粗
		style.setFont(headfont);

		// 设置第一行表头信息
		for (int i = 0; i < excelHeader.length; i++) {
			HSSFCell cell = row.createCell(i);
			cell.setCellValue(excelHeader[i]);
			cell.setCellStyle(style);
			// 自动修改列
			// sheet.autoSizeColumn(i);
		}

		// 设置其余行的列的值
		// 创建样式
		HSSFCellStyle styleOrder = wb.createCellStyle();
		// 居中
		styleOrder.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow(i + 1);
			userBean = list.get(i);
			// 每一行放值
			HSSFCell cell1 = row.createCell(0);
			cell1.setCellValue(userBean.getUserId());
			cell1.setCellStyle(styleOrder);
			HSSFCell cell2 = row.createCell(1);
			if(userBean.getUserName()==null){
				cell2.setCellValue("未录入");
			}else{
			cell2.setCellValue(userBean.getUserName());
			}
			cell2.setCellStyle(styleOrder);
			HSSFCell cell3 = row.createCell(2);
			
			cell3.setCellValue(userBean.getUserLogin());
			cell3.setCellStyle(styleOrder);
			HSSFCell cell4 = row.createCell(3);
			
				cell4.setCellValue(userBean.getUserPassword());
			
			cell4.setCellStyle(styleOrder);
			HSSFCell cell5 = row.createCell(4);
			if(userBean.getUserPhone()==null||"".equals(userBean.getUserPhone())){
				cell5.setCellValue("未录入");
			}else{
			cell5.setCellValue(userBean.getUserPhone());
			}
			cell5.setCellStyle(styleOrder);
			HSSFCell cell6 = row.createCell(5);
			if(userBean.getUserEmail()==null||"".equals(userBean.getUserEmail())){
				cell6.setCellValue("未录入");
			}else{
			cell6.setCellValue(userBean.getUserEmail());
			}
			cell6.setCellStyle(styleOrder);
			
			HSSFCell cell7 = row.createCell(6);
			if(userBean.getUserIdentity()==null||"".equals(userBean.getUserIdentity())){
				cell7.setCellValue("未录入");
			}else{
			cell7.setCellValue(userBean.getUserIdentity());
			}
			cell7.setCellStyle(styleOrder);
			
			String str = "";
			if (userBean.getUserState() == 1) {
				str = "启用";
			} else if (userBean.getUserState() == 0) {
				str = "禁用";
			} 
			
			HSSFCell cell8 = row.createCell(7);
		
				cell8.setCellValue(str);
			
			cell8.setCellStyle(styleOrder);
			
			HSSFCell cell9 = row.createCell(8);
			if(userBean.getUserRemark()==null||"".equals(userBean.getUserRemark())){
				cell9.setCellValue("未录入");
			}else{
			cell9.setCellValue(userBean.getUserRemark());
			}
			cell9.setCellStyle(styleOrder);
		}

		// 设置下载时客户端Excel的名称
		String filename = "用户信息.xls";
		try {
			filename = URLEncoder.encode(filename, "utf-8");

			// 设置响应信息类型
			response.setContentType("application/vnd.ms-excel");
			// 是指
			// 设置响应的头信息
			response.setHeader("Content-disposition", "attachment;filename="
					+ filename);
			// 通过输出流将文件输出到客户端
			OutputStream ouputStream = response.getOutputStream();
			wb.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*--------------添加和修改角色-------------*/
	@RequestMapping("userR.do")
	public void userR(Integer[]ids,Integer userId){
		System.out.println(userId);
		UserRoleBean urB=new UserRoleBean();
		List<UserRoleBean> ur=new ArrayList<UserRoleBean>();
		for(int i=0;i<ids.length;i++){
			urB.setRoleId(ids[i]);
			urB.setUserId(userId);
		}
		ur.add(urB);
		userService.insertUserR(ur);
	}
	@RequestMapping("update.do")
	public ModelAndView updateR(Integer userId){
		ModelAndView model=new ModelAndView("../user/selectUser.do");
		userService.update(userId);
		return model;
	}
}
