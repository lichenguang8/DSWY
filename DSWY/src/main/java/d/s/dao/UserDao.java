package d.s.dao;


import java.util.List;
import java.util.Map;

import d.s.domain.UserBean;

public interface UserDao {
	public UserBean findUser(UserBean user);
	public UserBean findUserId(UserBean user);
	public void updateUser(UserBean user);//更新个人信息和密码
	public UserBean oldPasswrod(UserBean user);//原密码与数据库对比
	public List<UserBean> listUser(Map<String,Object> map);//用户列表
	public Integer max(UserBean userBean);
}
