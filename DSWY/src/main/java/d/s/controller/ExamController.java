package d.s.controller;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import d.s.domain.ExamBean;
import d.s.domain.UserBean;
import d.s.service.ExamService;
import d.s.service.UserService;
import d.s.utils.PageUtil;

@Controller
@RequestMapping("exam")
public class ExamController {
	@Autowired
	private ExamService examService;
	@Autowired
	private UserService userService;
	

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public ExamService getExamService() {
		return examService;
	}

	public void setExamService(ExamService examService) {
		this.examService = examService;
	}
	@RequestMapping("selectAll.do")
	public ModelAndView selectAll(String examName,String starttime,String endtime,Integer examState,@RequestParam(value = "pageNum", defaultValue = "1")int pageNum){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date dateend=null;
		Date datestart=null;
		if (starttime==null||endtime == null) {
			
		}else{
			if (!"".equals(starttime)) {
				try {
					datestart= sdf.parse(starttime);	
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if (!"".equals(endtime)) {
				try {
					dateend =  sdf.parse(endtime);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		if(examState!=null && examState==0){
			examState=null;
		}
		Map<String,Object> map=new HashMap<String,Object>();
		PageUtil page=new PageUtil();
		page.setPageNum(pageNum);
		map.put("start", page.getStart());
		map.put("pageRows", page.getPageRows());
		map.put("examName", examName);
		map.put("datestart", datestart);
		map.put("dateend", dateend);
		map.put("examState", examState);
		List<ExamBean> examBeans=examService.max(page,map);
		ModelAndView mav=new ModelAndView("../html/exam/demo1/list.jsp");
		mav.addObject("page", page);
		mav.addObject("examName", examName);
		mav.addObject("starttime", starttime);
		mav.addObject("endtime", endtime);
		mav.addObject("examState", examState);
		mav.addObject("examBeans", examBeans);
		return mav;
	}
	@RequestMapping("select.do")
		public ModelAndView select(Integer examId){
			ExamBean examBean=examService.select(examId);
			ModelAndView mav=new ModelAndView("../html/exam/demo1/view.jsp");
			mav.addObject("examBean", examBean);
			return mav;
		}
	
	@RequestMapping("addExam.do")
	public ModelAndView addExam(){
		List<UserBean> userBeans=userService.list();
		
		ModelAndView mav=new ModelAndView("../html/exam/demo1/add.jsp");
		mav.addObject("userBeans", userBeans);
		return mav;
	}
	@RequestMapping("addTo.do")
	public ModelAndView addTo(ExamBean examBean){
		/*List<ExamBean> examBeans=examService.selectUID(examBean.getUserId());*/
		examService.insertAll(examBean);
		ModelAndView mav=new ModelAndView("../exam/selectAll.do");
		return mav;
	}
	
	
	@RequestMapping("examDel.do")
	public ModelAndView examDel(Integer examId){
		examService.examDel(examId);
		
		return selectAll(null,null,null,null,1);
	}
	@RequestMapping("deleteExamAll.do")
	public ModelAndView deleteRoleAll(Integer[] ids){
		for (int i = 0; i < ids.length; i++) {
			examService.examDel(ids[i]);
		}
		return selectAll(null,null,null,null,1);
	}
	
	
	
	@RequestMapping("selectAll2.do")
	public ModelAndView selectAll2(Integer examId,String starttime,String endtime,@RequestParam(value = "pageNum", defaultValue = "1")int pageNum){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date dateend=null;
		Date datestart=null;
		if (starttime==null||endtime == null) {
			
		}else{
			if (!"".equals(starttime)) {
				try {
					datestart= sdf.parse(starttime);	
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if (!"".equals(endtime)) {
				try {
					dateend =  sdf.parse(endtime);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		PageUtil page=new PageUtil();
		page.setPageNum(pageNum);
		map.put("start", page.getStart());
		map.put("pageRows", page.getPageRows());
		map.put("datestart", datestart);
		map.put("dateend", dateend);
		map.put("examId", examId);
		List<ExamBean> examBeans=examService.max2(page,map);
		ModelAndView mav=new ModelAndView("../html/exam/demo1/list2.jsp");
		mav.addObject("page", page);
		mav.addObject("starttime", starttime);
		mav.addObject("endtime", endtime);
		mav.addObject("examBeans", examBeans);
		return mav;
	}
	@RequestMapping("select2.do")
	public ModelAndView select2(Integer examId){
		ExamBean examBean=examService.select2(examId);
		ModelAndView mav=new ModelAndView("../html/exam/demo1/view2.jsp");
		mav.addObject("examBean", examBean);
		return mav;
	}
	@RequestMapping("update.do")
	public ModelAndView update(Integer examId){
		ExamBean examBean=examService.select(examId);
		ModelAndView mav=new ModelAndView("../html/exam/demo1/edit.jsp");
		mav.addObject("examBean", examBean);
		return mav;
	}
	@RequestMapping("updateTo.do")
	public ModelAndView updateTo(ExamBean examBean){
		examService.update(examBean);
		return selectAll(null,null,null,null,1);
	}
	@RequestMapping("updateOK.do")
	public ModelAndView updateOK(Integer examId){
		ExamBean examBean=examService.select(examId);
		examBean.setExamHstate(3);
		examService.update(examBean);
		return selectAll2(null,null,null,1);
	}
	@RequestMapping("updateOFF.do")
	public ModelAndView updateOFF(Integer examId){
		ExamBean examBean=examService.select(examId);
		examBean.setExamHstate(4);
		examService.update(examBean);
		return selectAll2(null,null,null,1);
	}
	@RequestMapping("updateState.do")
	public ModelAndView updateState(Integer examId){
		ExamBean examBean=examService.select(examId);
		examBean.setExamHstate(2);
		examService.update(examBean);
		return selectAll(null,null,null,null,1);
	}
}
