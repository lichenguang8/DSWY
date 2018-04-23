package d.s.service;

import java.util.List;

import d.s.domain.VehicleBean;

public interface VehicleService {
	public List<VehicleBean> selectAll(VehicleBean vehicle);
	public void insert(VehicleBean vehicle);
	public void delete(Integer vehicleId);
	public VehicleBean view(Integer vehicleId);
	public void update(VehicleBean vehicle);
	public Integer max(VehicleBean vehicle);
}
