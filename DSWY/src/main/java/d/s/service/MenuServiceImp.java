package d.s.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public MenuDao getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}

	public List<MenuBean> findMenu(Integer roleId) {
		List<MenuBean> LIST=new ArrayList<MenuBean>();
		List<MenuBean> list=menuDao.findMenu(roleId);
		
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
		/*System.out.println(LIST);*/
		return LIST;
	}	
}
