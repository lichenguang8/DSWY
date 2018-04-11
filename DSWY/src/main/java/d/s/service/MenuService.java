package d.s.service;

import java.util.List;

import d.s.domain.MenuBean;

public interface MenuService {
	public List<MenuBean> getMenu(Integer roleId);
	public List<MenuBean> getMenus();
	public MenuBean getMenuById(Integer menuId);
	public List<MenuBean> getTopMenu();
	public Integer getMaxPaixu();
	public List<MenuBean> selectMenu(MenuBean menuBean);
	public Integer max(MenuBean menuBean);
	public void insertMenu(MenuBean menuBean);
	public void updateMenu(MenuBean menuBean);
	public void deleteMenu(Integer menuId);
	
}
