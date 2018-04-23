package d.s.domain;

public class UVBean {
	private Integer userId;
	private String userName;
	private Integer vehicleId;
	private String vehicleName;
	private Integer uvState;
	private String uvDate;
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
	public Integer getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(Integer vehicleId) {
		this.vehicleId = vehicleId;
	}
	public String getVehicleName() {
		return vehicleName;
	}
	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}
	public Integer getUvState() {
		return uvState;
	}
	public void setUvState(Integer uvState) {
		this.uvState = uvState;
	}
	public String getUvDate() {
		return uvDate;
	}
	public void setUvDate(String uvDate) {
		this.uvDate = uvDate;
	}
	public Integer getCurrentNum() {
		return currentNum;
	}
	public void setCurrentNum(Integer currentNum) {
		this.currentNum = currentNum;
	}
	@Override
	public String toString() {
		return "UVBean [userId=" + userId + ", userName=" + userName + ", vehicleId=" + vehicleId + ", vehicleName="
				+ vehicleName + ", uvState=" + uvState + ", uvDate=" + uvDate + ", currentNum=" + currentNum + "]";
	}
	
	
}
