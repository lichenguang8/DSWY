package d.s.domain;

import java.util.ArrayList;
import java.util.List;

public class UserBean {
	private Integer userId;
	private String userName;
	private String userLogin;
	private String userPassword;
	private String userPhone;
	private Integer userState;
	private String userAddress;
	private Integer userGender;
	private String userEmail;
	private List<RoleBean> roleBean=new ArrayList<RoleBean>();
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
	
	public List<RoleBean> getRoleBean() {
		return roleBean;
	}
	public void setRoleBean(List<RoleBean> roleBean) {
		this.roleBean = roleBean;
	}
	@Override
	public String toString() {
		return "UserBean [userId=" + userId + ", userName=" + userName + ", userLogin=" + userLogin + ", userPassword="
				+ userPassword + ", userPhone=" + userPhone + ", userState=" + userState + ", userAddress="
				+ userAddress + ", userGender=" + userGender + ", userEmail=" + userEmail + ", roleBean=" + roleBean
				+ "]";
	}
	
}
