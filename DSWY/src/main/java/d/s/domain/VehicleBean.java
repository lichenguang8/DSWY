package d.s.domain;



//车辆
public class VehicleBean {
	private Integer vehicleId;//车辆编号
	private String vehicleName;//车辆名称
	private Integer vehicleStyle;//车辆类型
	private String vehicleNumber;//发动机号
	private String vehicleBdata;//购买时间
	private Integer vehicleState;//车辆状态
	private String vehicleDec;//车辆备注
	private Integer currentNum=1;
	
	public Integer getCurrentNum() {
		return currentNum;
	}
	public void setCurrentNum(Integer currentNum) {
		this.currentNum = currentNum;
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
	public Integer getVehicleStyle() {
		return vehicleStyle;
	}
	public void setVehicleStyle(Integer vehicleStyle) {
		this.vehicleStyle = vehicleStyle;
	}
	public String getVehicleNumber() {
		return vehicleNumber;
	}
	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}
	
	
	public String getVehicleBdata() {
		return vehicleBdata;
	}
	public void setVehicleBdata(String vehicleBdata) {
		this.vehicleBdata = vehicleBdata;
	}
	public Integer getVehicleState() {
		return vehicleState;
	}
	public void setVehicleState(Integer vehicleState) {
		this.vehicleState = vehicleState;
	}
	
	public String getVehicleDec() {
		return vehicleDec;
	}
	public void setVehicleDec(String vehicleDec) {
		this.vehicleDec = vehicleDec;
	}
	@Override
	public String toString() {
		return "VehicleBean [vehicleId=" + vehicleId + ", vehicleName=" + vehicleName + ", vehicleStyle=" + vehicleStyle
				+ ", vehicleNumber=" + vehicleNumber + ", vehicleBdata=" + vehicleBdata + ", vehicleState="
				+ vehicleState + ", vehicleDec=" + vehicleDec + ", currentNum=" + currentNum + "]";
	}
	
	
}
