package d.s.service;

import java.util.List;

import d.s.domain.MenuBean;

public interface MenuService {
	public List<MenuBean> findMenu(Integer roleId);
}
