package d.s.dao;

import java.util.List;

import d.s.domain.MenuBean;

public interface MenuDao {
	public List<MenuBean> findMenu(Integer roleId);
}
