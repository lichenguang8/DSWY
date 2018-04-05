package d.s.service;

import java.util.List;

import d.s.domain.UserBean;

public interface UserService {
	public UserBean findUser(UserBean user);
	public UserBean findUserId(Integer userId);
}
