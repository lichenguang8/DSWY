package d.s.controller;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import d.s.domain.UVBean;
import d.s.domain.UserBean;
import d.s.service.UVService;
import d.s.service.UserService;

@Controller
@RequestMapping("uv")
public class UVController {

	@Autowired
	private UVService uvService;
	private UserService userService;
	

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public UVService getUvService() {
		return uvService;
	}

	public void setUvService(UVService uvService) {
		this.uvService = uvService;
	}
	@RequestMapping("select.do")
	public ModelAndView uvSelect(UVBean uvBean){
		ModelAndView mav=new ModelAndView("../html/vehicle/list2.jsp");
		List<UVBean> uvs=uvService.uvBean(uvBean);
		mav.addObject("uvs", uvs);
		mav.addObject("userId", uvBean.getUserId());
		mav.addObject("uvState", uvBean.getUvState());
		return mav;
	}
	@RequestMapping("deleteAll.do")
	public ModelAndView deleteAll(Integer[] ids){
		ModelAndView mav=new ModelAndView("../uv/select.do");
		for (int i = 0; i < ids.length; i++) {
			uvService.delete(ids[i]);
		}
		return mav;
	}
	@RequestMapping("deleteId.do")
	public ModelAndView deleteId(Integer vehicleId){
		ModelAndView mav=new ModelAndView("../uv/select.do");
		uvService.delete(vehicleId);
		return mav;
	}
	@RequestMapping("excl.do")
	public void excel(Integer[] ids, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		// 创建excel表头部分
		String[] excelHeader = { "用户编号", "用户姓名", "车辆编号","车辆名称", "车辆分配时间","车辆状态"};
		// 创建集合（从数据库中查询出来）

		List<UVBean> list = new ArrayList<UVBean>();
		UVBean uvBean = null;
		for (int i = 0; i < ids.length; i++) {
			uvBean =uvService.getUVById(ids[i]);
			list.add(uvBean);
		}
		System.out.println(list.size());
		// 创建Excel对象
		HSSFWorkbook wb = new HSSFWorkbook();
		// 创建sheet
		HSSFSheet sheet = wb.createSheet("分配信息");
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
			uvBean = list.get(i);
			// 每一行放值
			HSSFCell cell1 = row.createCell(0);
			cell1.setCellValue(uvBean.getUserId());
			cell1.setCellStyle(styleOrder);
			HSSFCell cell2 = row.createCell(1);
			if(uvBean.getUserName()==null){
				cell2.setCellValue("未录入");
			}else{
			cell2.setCellValue(uvBean.getUserName());
			}
			cell2.setCellStyle(styleOrder);
			HSSFCell cell3 = row.createCell(2);
			
			cell3.setCellValue(uvBean.getVehicleId());
			cell3.setCellStyle(styleOrder);
			HSSFCell cell4 = row.createCell(3);
			cell4.setCellValue(uvBean.getVehicleName());
			cell4.setCellStyle(styleOrder);
			/*HSSFCell cell5 = row.createCell(4);
			cell5.setCellValue(uvBean.getUvDate());
			cell5.setCellStyle(styleOrder);*/
			HSSFCell cell5 = row.createCell(4);
			if(uvBean.getUvDate()==null||"".equals(uvBean.getUvDate())){
				cell5.setCellValue("null");
			}else{
			cell5.setCellValue(uvBean.getUvDate());
			}
			cell5.setCellStyle(styleOrder);
			
			String str = "";
			if (uvBean.getUvState() == 1) {
				str = "已分配";
			} else if (uvBean.getUvState() == 2) {
				str = "未分配";
			} 
			HSSFCell cell6 = row.createCell(5);
				cell6.setCellValue(str);
			cell6.setCellStyle(styleOrder);
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
}
