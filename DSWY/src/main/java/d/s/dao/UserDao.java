package d.s.dao;

import java.util.List;

import d.s.domain.UserBean;

public interface UserDao {
	public UserBean findUser(UserBean user);
	public UserBean findUserId(Integer userId);
}
