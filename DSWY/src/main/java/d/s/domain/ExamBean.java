package d.s.domain;



//考试
public class ExamBean {
	private Integer examId;//考试编号
	private String examName;//考试科目
	private Integer examState;//考试状态
	private Integer examHstate;//审核状态
	private String examNumber;//考试分值
	private String examSubdata;//考试考试时间
	private String examAppdata;//考试申请时间
	private String examDescribe;//考试描述
	private Integer userId;//用户Id
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
	public Integer getExamState() {
		return examState;
	}
	public void setExamState(Integer examState) {
		this.examState = examState;
	}
	public Integer getExamHstate() {
		return examHstate;
	}
	public void setExamHstate(Integer examHstate) {
		this.examHstate = examHstate;
	}
	public String getExamNumber() {
		return examNumber;
	}
	public void setExamNumber(String examNumber) {
		this.examNumber = examNumber;
	}
	public String getExamSubdata() {
		return examSubdata;
	}
	public void setExamSubdata(String examSubdata) {
		this.examSubdata = examSubdata;
	}
	public String getExamAppdata() {
		return examAppdata;
	}
	public void setExamAppdata(String examAppdata) {
		this.examAppdata = examAppdata;
	}
	public String getExamDescribe() {
		return examDescribe;
	}
	public void setExamDescribe(String examDescribe) {
		this.examDescribe = examDescribe;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	

	@Override
	public String toString() {
		return "ExamBean [examId=" + examId + ", examName=" + examName + ", examState=" + examState + ", examHstate="
				+ examHstate + ", examNumber=" + examNumber + ", examSubdata=" + examSubdata + ", examAppdata="
				+ examAppdata + ", examDescribe=" + examDescribe + ", userId=" + userId + "]";
	}
	
	
}
