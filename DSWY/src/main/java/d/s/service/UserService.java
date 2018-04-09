package d.s.service;


import java.util.List;
import java.util.Map;

import d.s.domain.UserBean;

public interface UserService {
	public UserBean findUser(UserBean user);
	public UserBean findUserId(UserBean user);
	public void updateUser(UserBean user);//更新个人信息和密码
	public UserBean oldPasswrod(UserBean user);//原密码查找
	public List<UserBean> listUser(Map<String,Object> map);//用户列表
	public Integer max(UserBean userBean);
}
