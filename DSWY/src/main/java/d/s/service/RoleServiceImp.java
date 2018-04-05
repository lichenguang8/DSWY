package d.s.service;

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

	public RoleBean findRole(Integer roleId) {
		return roleDao.findRole(roleId);
	}

}
