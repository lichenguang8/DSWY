package d.s.dao;

import java.util.List;

import d.s.domain.UVBean;

public interface UVDao {
	public List<UVBean> uvBean(UVBean uvBean);
	public void delete(Integer vehicleId);
	public UVBean getUVById(Integer vehicleId);
}
