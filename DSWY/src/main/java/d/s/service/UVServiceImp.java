package d.s.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import d.s.dao.UVDao;
import d.s.dao.UserDao;
import d.s.dao.VehicleDao;
import d.s.domain.UVBean;
import d.s.domain.UserBean;
import d.s.domain.VehicleBean;
@Service
@Transactional
public class UVServiceImp implements UVService {
	@Autowired
	private UVDao uvDao;
	public UVDao getUvDao() {
		return uvDao;
	}

	public void setUvDao(UVDao uvDao) {
		this.uvDao = uvDao;
	}

	public List<UVBean> uvBean(UVBean uvBean) {
		List<UVBean> uvs=uvDao.uvBean(uvBean);
		return uvs;
	}

	public void delete(Integer vehicleId) {
		uvDao.delete(vehicleId);
	}

	public UVBean getUVById(Integer vehicleId) {
		
		return uvDao.getUVById(vehicleId);
	}
	
}
