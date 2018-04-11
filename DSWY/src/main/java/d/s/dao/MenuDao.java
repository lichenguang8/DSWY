package d.s.dao;

import java.util.List;

import d.s.domain.MenuBean;

public interface MenuDao {
	public List<MenuBean> getMenu(Integer roleId);
	public MenuBean getMenuById(Integer menuId);
	public List<MenuBean> selectMenu(MenuBean menuBean);
	public List<MenuBean> getMenus();
	public Integer max(MenuBean menuBean);
	public void insertMenu(MenuBean menuBean);
	public void updateMenu(MenuBean menuBean);
	public void deleteMenu(Integer menuId);
	public void deleteRoleMenu(Integer menuId);
	public List<MenuBean> getTopMenu();
	public Integer getMaxPaixu();
}
