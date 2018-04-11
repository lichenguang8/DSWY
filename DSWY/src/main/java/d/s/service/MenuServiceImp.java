package d.s.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import d.s.dao.MenuDao;
import d.s.domain.MenuBean;
@Service
@Transactional
public class MenuServiceImp implements MenuService {
	@Autowired
	private MenuDao menuDao;
	
	public List<MenuBean> getMenu(Integer roleId) {
		// TODO Auto-generated method stub
		List<MenuBean> LIST=new ArrayList<MenuBean>();
		List<MenuBean> list=menuDao.getMenu(roleId);
		for (MenuBean menuBean : list) {
			if (menuBean.getTopId()==0) {
				LIST.add(menuBean);
			}
		}
		for (MenuBean menuBean : LIST) {
			for (MenuBean m : list) {
				if (m.getTopId()==menuBean.getMenuId()) {
					menuBean.getMenuList().add(m);
				}
			}
		}
		return LIST;
	}

	public List<MenuBean> selectMenu(MenuBean menuBean) {
		// TODO Auto-generated method stub
		menuBean.setCurrentNum((menuBean.getCurrentNum()-1)*8);
		List<MenuBean> list=menuDao.selectMenu(menuBean);
		menuBean.setCurrentNum(menuBean.getCurrentNum()/8+1);
		
		return list;
		
	}

	public void insertMenu(MenuBean menuBean) {
		// TODO Auto-generated method stub
		menuDao.insertMenu(menuBean);
	}

	public List<MenuBean> getTopMenu() {
		// TODO Auto-generated method stub
		return menuDao.getTopMenu();
	}

	public Integer getMaxPaixu() {
		// TODO Auto-generated method stub
		return menuDao.getMaxPaixu();
	}

	public MenuBean getMenuById(Integer menuId) {
		// TODO Auto-generated method stub
		return menuDao.getMenuById(menuId);
	}

	public void updateMenu(MenuBean menuBean) {
		// TODO Auto-generated method stub
		menuDao.updateMenu(menuBean);
	}

	public void deleteMenu(Integer menuId) {
		// TODO Auto-generated method stub
		menuDao.deleteRoleMenu(menuId);
		menuDao.deleteMenu(menuId);
	}

	public Integer max(MenuBean menuBean) {
		// TODO Auto-generated method stub
		return menuDao.max(menuBean);
	}

	public List<MenuBean> getMenus() {
		
		List<MenuBean> LIST=new ArrayList<MenuBean>();
		List<MenuBean> list=menuDao.getMenus();
		for (MenuBean menuBean : list) {
			if (menuBean.getTopId()==0) {
				LIST.add(menuBean);
			}
		}
		for (MenuBean menuBean : LIST) {
			for (MenuBean m : list) {
				if (m.getTopId()==menuBean.getMenuId()) {
					menuBean.getMenuList().add(m);
				}
			}
		}
		return LIST;
	}
}
