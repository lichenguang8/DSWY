package d.s.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import d.s.dao.UserDao;
import d.s.domain.UserBean;
import d.s.domain.UserRoleBean;

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

	public List<UserBean> listUser(UserBean user) {
		user.setCurrentNum((user.getCurrentNum()-1)*8);
		List<UserBean> userBean=userDao.listUser(user);
		user.setCurrentNum(user.getCurrentNum()/8+1);
		return userBean;
	}

	public Integer max(UserBean userBean) {
		
		return userDao.max(userBean);
	}

	public void insertUser(UserBean user) {
		userDao.insertUser(user);
		
	}

	public UserBean getUserById(Integer userId) {
		
		return userDao.getUserById(userId);
	}

	public void deleteUser(Integer userId) {
		userDao.deleteUser(userId);
		
	}

	public void insertUserR(List<UserRoleBean> ur) {
		userDao.insertUserR(ur);;
		
	}

	public void update(Integer userId) {
		userDao.update(userId);
		
	}

	
}
