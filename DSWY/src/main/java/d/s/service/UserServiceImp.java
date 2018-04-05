package d.s.service;

import java.util.List;

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

	public UserBean findUserId(Integer userId) {
		return userDao.findUserId(userId);
		
	}

	
}
