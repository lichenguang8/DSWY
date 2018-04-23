package d.s.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import d.s.domain.VehicleBean;
import d.s.service.VehicleService;

@Controller
@RequestMapping("vehicle")
public class VehicleController {
	@Autowired
	private VehicleService vehicleService;

	public VehicleService getVehicleService() {
		return vehicleService;
	}

	public void setVehicleService(VehicleService vehicleService) {
		this.vehicleService = vehicleService;
	}
	@RequestMapping("add.do")
	public ModelAndView addVehicle(){
		ModelAndView mav=new ModelAndView("../html/vehicle/add.jsp");
		return mav;
	}
	@RequestMapping("addTo.do")
	public ModelAndView addTo(VehicleBean vehicle){
		vehicleService.insert(vehicle);
		return selectAll(null);
	}
	@RequestMapping("selectAll.do")
	public ModelAndView selectAll(VehicleBean vehicleBean){
		if(vehicleBean==null){
			vehicleBean=new VehicleBean();
		}
		if(vehicleBean.getVehicleStyle()!=null&&vehicleBean.getVehicleStyle()==0){
			vehicleBean.setVehicleStyle(null);
		}
		List<VehicleBean> vehicleBeans=vehicleService.selectAll(vehicleBean);
		Integer max=vehicleService.max(vehicleBean);
		ModelAndView mav=new ModelAndView("../html/vehicle/list.jsp");
		mav.addObject("vehicle", vehicleBean);
		mav.addObject("vehicleBeans", vehicleBeans);
		mav.addObject("maxSize",max);
		mav.addObject("pageNum", (int)Math.ceil(max/8.0));
		mav.addObject("currentPage", vehicleBean.getCurrentNum());
		return mav;
	}
	@RequestMapping("deleteAll.do")
	public ModelAndView deleteAll(Integer[] ids){
		for (int i = 0; i < ids.length; i++) {
			vehicleService.delete(ids[i]);
		}
		return selectAll(null);
	}
	@RequestMapping("deleteO.do")
	public ModelAndView deleteO(Integer vehicleId){		
		vehicleService.delete(vehicleId);
		return selectAll(null);
	}
	@RequestMapping("view.do")
	public ModelAndView view(Integer vehicleId){
		VehicleBean vehicleBean=vehicleService.view(vehicleId);
		ModelAndView mav=new ModelAndView("../html/vehicle/view.jsp");
		mav.addObject("vehicle", vehicleBean);
		return mav;
	}
	@RequestMapping("update.do")
	public ModelAndView update(VehicleBean vehicleBean){
		vehicleService.update(vehicleBean);
		return selectAll(null);
	}
	
	@RequestMapping("updateX.do")
	public ModelAndView updateX(VehicleBean vehicleBean){
		vehicleBean.setVehicleState(2);
		vehicleService.update(vehicleBean);
		return selectAll(null);
	}
	@RequestMapping("updateQ.do")
	public ModelAndView updateQ(VehicleBean vehicleBean){
		vehicleBean.setVehicleState(1);
		vehicleService.update(vehicleBean);
		return selectAll(null);
	}
	@RequestMapping("updateB.do")
	public ModelAndView updateB(VehicleBean vehicleBean){
		vehicleBean.setVehicleState(3);
		vehicleService.update(vehicleBean);
		return selectAll(null);
	}
}
