package d.s.domain;

import java.util.ArrayList;
import java.util.List;

public class MenuBean {
	private Integer menuId;
	private String menuName;
	private String menuUrl;
	private Integer menuState;
	private Integer topId;
	private String menuRemark;
	private Integer menuPaixu;
	private List<MenuBean> menuList=new ArrayList<MenuBean>();
	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public Integer getMenuState() {
		return menuState;
	}
	public void setMenuState(Integer menuState) {
		this.menuState = menuState;
	}
	public Integer getTopId() {
		return topId;
	}
	public void setTopId(Integer topId) {
		this.topId = topId;
	}
	public String getMenuRemark() {
		return menuRemark;
	}
	public void setMenuRemark(String menuRemark) {
		this.menuRemark = menuRemark;
	}
	public Integer getMenuPaixu() {
		return menuPaixu;
	}
	public void setMenuPaixu(Integer menuPaixu) {
		this.menuPaixu = menuPaixu;
	}
	public List<MenuBean> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<MenuBean> menuList) {
		this.menuList = menuList;
	}
	@Override
	public String toString() {
		return "MenuBean [menuId=" + menuId + ", menuName=" + menuName + ", menuUrl=" + menuUrl + ", menuState="
				+ menuState + ", topId=" + topId + ", menuRemark=" + menuRemark + ", menuPaixu=" + menuPaixu
				+ ", menuList=" + menuList + "]";
	}
	
	
	
}
