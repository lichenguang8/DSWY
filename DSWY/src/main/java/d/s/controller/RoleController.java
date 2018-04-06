package d.s.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import d.s.domain.RoleBean;

@RequestMapping("role")
public class RoleController {
	@RequestMapping("listRole.do")
	public ModelAndView listRole(RoleBean roles){
		ModelAndView model=new ModelAndView();
		model.setViewName("redirect:../html/");
		return model;
		
	}
}
