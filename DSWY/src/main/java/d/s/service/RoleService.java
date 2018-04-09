package d.s.service;

import java.util.List;

import d.s.domain.RoleBean;

public interface RoleService {
	public RoleBean findRole(Integer roleId);
	public List<RoleBean> listRole();
}
