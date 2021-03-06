package d.s.service;


import java.util.List;
import java.util.Map;

import d.s.domain.UserBean;
import d.s.domain.UserRoleBean;

public interface UserService {
	public UserBean findUser(UserBean user);
	public UserBean findUserId(UserBean user);
	public void updateUser(UserBean user);//更新个人信息和密码
	public UserBean oldPasswrod(UserBean user);//原密码查找
	public List<UserBean> listUser(UserBean user);//用户列表
	public void insertUser(UserBean user);//用户添加
	public UserBean getUserById(Integer userId);
	public void deleteUser(Integer userId);
	public Integer max(UserBean userBean);
	public List<UserBean> list();
	
	public void insertUserR(List<UserRoleBean> ur);//用户添加
	public void update(Integer userId);
}
