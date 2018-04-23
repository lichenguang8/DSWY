package d.s.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import d.s.dao.ExamDao;
import d.s.domain.ExamBean;
import d.s.utils.PageUtil;
@Service
@Transactional
public class ExamServiceImp implements ExamService {
	@Autowired
	private ExamDao examDao;
	
	public ExamDao getExamDao() {
		return examDao;
	}

	public void setExamDao(ExamDao examDao) {
		this.examDao = examDao;
	}

	public List<ExamBean> selectAll(Map<String,Object> map) {
		
		return examDao.selectAll(map);
	}

	public void insertAll(ExamBean examBean) {
		examDao.insertAll(examBean);
	}


	public void examDel(Integer examId) {
	examDao.examDel(examId);
		
	}
	public ExamBean select(Integer examId) {
		return examDao.select(examId);
	}
	public ExamBean select2(Integer examId) {
		return examDao.select(examId);
	}
	public List<ExamBean> max(PageUtil page,Map<String, Object> map){
		// 第一步查询总条数
		int totleRows = Integer.parseInt(this.examDao.max(map) + "" );
		// 封装分页信息
		page.setTotleRows(totleRows);
		// 计算总页数
		page.setTotlePages(totleRows%page.getPageRows()==0?totleRows/page.getPageRows():totleRows/page.getPageRows()+1);
		return examDao.selectAll(map);
	}
	public List<ExamBean> selectAll2(Map<String,Object> map) {
		
		return examDao.selectAll2(map);
	}

	public List<ExamBean> max2(PageUtil page,Map<String, Object> map){
		// 第一步查询总条数
		int totleRows = Integer.parseInt(this.examDao.max2(map) + "" );
		// 封装分页信息
		page.setTotleRows(totleRows);
		// 计算总页数
		page.setTotlePages(totleRows%page.getPageRows()==0?totleRows/page.getPageRows():totleRows/page.getPageRows()+1);
		return examDao.selectAll2(map);
	}

	public void update(ExamBean examBean) {
		// TODO Auto-generated method stub
		examDao.update(examBean);
	}


}
