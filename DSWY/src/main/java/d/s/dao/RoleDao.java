package d.s.dao;

import java.util.List;

import d.s.domain.RoleBean;

public interface RoleDao {
	public RoleBean findRole(Integer roleId);
	public List<RoleBean> listRole();
}
