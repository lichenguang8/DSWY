package d.s.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import d.s.dao.UserDao;
import d.s.domain.UserBean;

@Service
@Transactional
public class UserServiceImp implements UserService {
	@Autowired
	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserBean findUser(UserBean user) {
		return userDao.findUser(user);
	}

	public UserBean findUserId(UserBean user) {
		return userDao.findUserId(user);
		
	}

	public void updateUser(UserBean user) {
		userDao.updateUser(user);
	}

	public UserBean oldPasswrod(UserBean user) {
		
		return userDao.oldPasswrod(user);
	}

	public List<UserBean> listUser(Map<String,Object> map) {
		List<UserBean> userBean=userDao.listUser(map);
		return userBean;
	}

	public Integer max(UserBean userBean) {
		
		return userDao.max(userBean);
	}
	
}
