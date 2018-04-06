package d.s.domain;

import java.util.Date;

//考试
public class ExamBean {
	private Integer examId;//考试编号
	private String examName;//考试科目
	private String examState;//考试状态
	private Date examSundata;//考试预约时间
	private Date examAppdata;//考试申请时间
	private String examDescribe;//考试描述
	public Integer getExamId() {
		return examId;
	}
	public void setExamId(Integer examId) {
		this.examId = examId;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public String getExamState() {
		return examState;
	}
	public void setExamState(String examState) {
		this.examState = examState;
	}
	public Date getExamSundata() {
		return examSundata;
	}
	public void setExamSundata(Date examSundata) {
		this.examSundata = examSundata;
	}
	public Date getExamAppdata() {
		return examAppdata;
	}
	public void setExamAppdata(Date examAppdata) {
		this.examAppdata = examAppdata;
	}
	public String getExamDescribe() {
		return examDescribe;
	}
	public void setExamDescribe(String examDescribe) {
		this.examDescribe = examDescribe;
	}
	@Override
	public String toString() {
		return "ExamBean [examId=" + examId + ", examName=" + examName + ", examState=" + examState + ", examDescribe="
				+ examDescribe + "]";
	}
	
	
}
