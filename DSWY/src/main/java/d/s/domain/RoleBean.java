package d.s.domain;

import java.util.ArrayList;
import java.util.List;

public class RoleBean {
	private Integer roleId;
	private String roleName;
	private Integer roleState;
	private String roleDescribe;
	private List<MenuBean> menuBean=new ArrayList<MenuBean>();
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Integer getRoleState() {
		return roleState;
	}
	public void setRoleState(Integer roleState) {
		this.roleState = roleState;
	}
	public String getRoleDescribe() {
		return roleDescribe;
	}
	public void setRoleDescribe(String roleDescribe) {
		this.roleDescribe = roleDescribe;
	}
	public List<MenuBean> getMenuBean() {
		return menuBean;
	}
	public void setMenuBean(List<MenuBean> menuBean) {
		this.menuBean = menuBean;
	}
	@Override
	public String toString() {
		return "RoleBean [roleId=" + roleId + ", roleName=" + roleName + ", roleState=" + roleState + ", roleDescribe="
				+ roleDescribe + ", menuBean=" + menuBean + "]";
	}
	
}
