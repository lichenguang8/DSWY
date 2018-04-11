package d.s.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import d.s.dao.RoleDao;
import d.s.domain.RoleBean;
@Service
@Transactional
public class RoleServiceImp implements RoleService {
	@Autowired
	private RoleDao roleDao;
	
	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}
	

	public List<RoleBean> findRole(RoleBean role) {
		role.setCurrentNum((role.getCurrentNum()-1)*8);
		List<RoleBean> list=roleDao.findRole(role);
		role.setCurrentNum(role.getCurrentNum()/8+1);
		return list;
	}

	public List<RoleBean> listRole() {
	
		return roleDao.listRole();
		
	}

	public RoleBean getRoleId(Integer roleId) {
		
		return roleDao.getRoleId(roleId);
	}

	public void deleteRole(Integer roleId) {
		roleDao.deleteRole(roleId);
		
	}

	public void updateRole(RoleBean roleBean) {
		roleDao.updateRole(roleBean);
		
	}

	public void insertRole(RoleBean roleBean) {
		roleDao.insertRole(roleBean);
		
	}

	public Integer max(RoleBean roleBean) {
		
		return roleDao.max(roleBean);
	}

}
