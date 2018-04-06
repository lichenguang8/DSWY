package d.s.domain;

import java.util.Date;

//车辆
public class VehicleBean {
	private Integer vehicleId;//车辆编号
	private String vehicleName;//车辆名称
	private String vehicleStyle;//车辆类型
	private String vehicleNumber;//发动机号
	private Date vehicleBdata;//购买时间
	private Date vehicleAdata;//分配日期
	private String vehicleState;//车辆状态
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
	public String getVehicleStyle() {
		return vehicleStyle;
	}
	public void setVehicleStyle(String vehicleStyle) {
		this.vehicleStyle = vehicleStyle;
	}
	public String getVehicleNumber() {
		return vehicleNumber;
	}
	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}
	
	
	public Date getVehicleBdata() {
		return vehicleBdata;
	}
	public void setVehicleBdata(Date vehicleBdata) {
		this.vehicleBdata = vehicleBdata;
	}
	public Date getVehicleAdata() {
		return vehicleAdata;
	}
	public void setVehicleAdata(Date vehicleAdata) {
		this.vehicleAdata = vehicleAdata;
	}
	public String getVehicleState() {
		return vehicleState;
	}
	public void setVehicleState(String vehicleState) {
		this.vehicleState = vehicleState;
	}
	@Override
	public String toString() {
		return "VehicleBean [vehicleId=" + vehicleId + ", vehicleName=" + vehicleName + ", vehicleStyle=" + vehicleStyle
				+ ", vehicleNumber=" + vehicleNumber + ", vehicleState=" + vehicleState + "]";
	}
	
}
