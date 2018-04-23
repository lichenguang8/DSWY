package d.s.dao;

import java.util.List;
import java.util.Map;

import d.s.domain.ExamBean;

public interface ExamDao {
	public List<ExamBean> selectAll(Map<String,Object> map);
	public long max(Map<String,Object> map);
	public List<ExamBean> selectAll2(Map<String,Object> map);
	public long max2(Map<String,Object> map);
	public void insertAll(ExamBean examBean);
	public void examDel(Integer examId);
	public ExamBean select(Integer examId);
	public void update(ExamBean examBean);
}
