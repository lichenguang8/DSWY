package d.s.service;


import d.s.domain.UserBean;

public interface UserService {
	public UserBean findUser(UserBean user);
	public UserBean findUserId(Integer userId);
	public void updataUser(UserBean user);
}
