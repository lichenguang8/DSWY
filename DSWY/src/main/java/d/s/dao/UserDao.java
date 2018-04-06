package d.s.dao;


import d.s.domain.UserBean;

public interface UserDao {
	public UserBean findUser(UserBean user);
	public UserBean findUserId(Integer userId);
	public void updateUser(UserBean user);
}
