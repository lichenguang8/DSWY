package d.s.domain;

import java.util.ArrayList;
import java.util.List;

public class MenuBean {
	private Integer menuId;//菜单编号
	private String menuName;//菜单名称
	private String menuUrl;//菜单URL
	private Integer menuState;//菜单状态
	private Integer topId;//菜单父ID
	private String menuRemark;//菜单描述
	private Integer menuPaixu;//菜单排序
	private List<MenuBean> menuList=new ArrayList<MenuBean>();
	private Integer currentNum=1;
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
	
	public Integer getCurrentNum() {
		return currentNum;
	}
	public void setCurrentNum(Integer currentNum) {
		this.currentNum = currentNum;
	}
	@Override
	public String toString() {
		return "MenuBean [menuId=" + menuId + ", menuName=" + menuName + ", menuUrl=" + menuUrl + ", menuState="
				+ menuState + ", topId=" + topId + ", menuRemark=" + menuRemark + ", menuPaixu=" + menuPaixu
				+ ", menuList=" + menuList + ", currentNum=" + currentNum + "]";
	}
	
	
	
}
