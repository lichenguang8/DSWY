package d.s.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserBean {
	private Integer userId;//用户编号
	private String userName;//用户姓名
	private String userLogin;//登录账号
	private String userPassword;//登录密码
	private String userPhone;//手机号
	private Integer userState;//用户状态
	private String userAddress;//家庭地址
	private Integer userGender;//年龄
	private String userEmail;//Email
	private String userSex;//性别
	private Date userData;//出生日期
	private String userIdentity;//身份证号
	private List<RoleBean> roleBean=new ArrayList<RoleBean>();//角色
	private String userRemark;//备注
	private String userPicture;//图片
	private Integer currentNum=1;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserLogin() {
		return userLogin;
	}
	public void setUserLogin(String userLogin) {
		this.userLogin = userLogin;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public Integer getUserState() {
		return userState;
	}
	public void setUserState(Integer userState) {
		this.userState = userState;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public Integer getUserGender() {
		return userGender;
	}
	public void setUserGender(Integer userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public Date getUserData() {
		return userData;
	}
	public void setUserData(Date userData) {
		this.userData = userData;
	}
	public String getUserIdentity() {
		return userIdentity;
	}
	public void setUserIdentity(String userIdentity) {
		this.userIdentity = userIdentity;
	}
	public List<RoleBean> getRoleBean() {
		return roleBean;
	}
	public void setRoleBean(List<RoleBean> roleBean) {
		this.roleBean = roleBean;
	}
	public String getUserRemark() {
		return userRemark;
	}
	public void setUserRemark(String userRemark) {
		this.userRemark = userRemark;
	}
	public String getUserPicture() {
		return userPicture;
	}
	public void setUserPicture(String userPicture) {
		this.userPicture = userPicture;
	}
	
	public Integer getCurrentNum() {
		return currentNum;
	}
	public void setCurrentNum(Integer currentNum) {
		this.currentNum = currentNum;
	}
	@Override
	public String toString() {
		return "UserBean [userId=" + userId + ", userName=" + userName + ", userLogin=" + userLogin + ", userPassword="
				+ userPassword + ", userPhone=" + userPhone + ", userState=" + userState + ", userAddress="
				+ userAddress + ", userGender=" + userGender + ", userEmail=" + userEmail + ", userSex=" + userSex
				+ ", userData=" + userData + ", userIdentity=" + userIdentity + ", roleBean=" + roleBean
				+ ", userRemark=" + userRemark + ", userPicture=" + userPicture + ", currentNum=" + currentNum + "]";
	}
	
}
