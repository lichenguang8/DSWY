package d.s.dao;

import java.util.List;

import d.s.domain.MenuBean;
import d.s.domain.RoleBean;

public interface RoleDao {
	public List<RoleBean> findRole(RoleBean role);
	public List<RoleBean> listRole();
	public RoleBean getRoleId(Integer roleId);
	public void deleteRole(Integer roleId);
	public void updateRole(RoleBean roleBean);
	public void insertRole(RoleBean roleBean);
	public Integer max(RoleBean RoleBean);
}
