package d.s.service;

import java.util.List;
import java.util.Map;

import d.s.domain.ExamBean;
import d.s.utils.PageUtil;

public interface ExamService {
	public List<ExamBean> selectAll(Map<String,Object> map);
	public List<ExamBean> max(PageUtil page,Map<String, Object> map);
	public List<ExamBean> selectAll2(Map<String,Object> map);
	public List<ExamBean> max2(PageUtil page,Map<String, Object> map);
	public void insertAll(ExamBean examBean);
	public void examDel(Integer examId);
	public ExamBean select(Integer examId);
	public ExamBean select2(Integer examId);
	public void update(ExamBean examBean);
	
}
