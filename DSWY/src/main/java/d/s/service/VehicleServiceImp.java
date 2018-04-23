package d.s.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import d.s.dao.VehicleDao;
import d.s.domain.VehicleBean;

@Service
@Transactional
public class VehicleServiceImp implements VehicleService {
	@Autowired
	private VehicleDao vehicleDao;
	
	public VehicleDao getVehicleDao() {
		return vehicleDao;
	}

	public void setVehicleDao(VehicleDao vehicleDao) {
		this.vehicleDao = vehicleDao;
	}

	public List<VehicleBean> selectAll(VehicleBean vehicle) {
		vehicle.setCurrentNum((vehicle.getCurrentNum()-1)*8);
		List<VehicleBean> list= vehicleDao.selectAll(vehicle);
		vehicle.setCurrentNum(vehicle.getCurrentNum()/8+1);
		return list;
	}

	public void insert(VehicleBean vehicle) {
		vehicleDao.insert(vehicle);
		
	}

	public void delete(Integer vehicleId) {
		vehicleDao.delete(vehicleId);
		
	}

	public VehicleBean view(Integer vehicleId) {
		
		return vehicleDao.view(vehicleId);
	}

	public void update(VehicleBean vehicle) {
		// TODO Auto-generated method stub
		vehicleDao.update(vehicle);
	}

	public Integer max(VehicleBean vehicle) {
		
		return vehicleDao.max(vehicle);
	}

}
