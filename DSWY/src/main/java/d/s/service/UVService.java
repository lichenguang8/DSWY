package d.s.service;

import java.util.List;

import d.s.domain.UVBean;

public interface UVService {
	public List<UVBean> uvBean(UVBean uvBean);
	public void delete(Integer vehicleId);
	public UVBean getUVById(Integer vehicleId);
}
