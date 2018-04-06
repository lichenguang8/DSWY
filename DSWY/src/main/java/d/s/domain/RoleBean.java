package d.s.domain;

import java.util.ArrayList;
import java.util.List;

public class RoleBean {
	private Integer roleId;//角色编号
	private String roleName;//角色名称
	private Integer roleState;//角色状态
	private String roleRemark;//角色分类标识
	private String roleDescribe;//角色描述
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
	public String getRoleRemark() {
		return roleRemark;
	}
	public void setRoleRemark(String roleRemark) {
		this.roleRemark = roleRemark;
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
		return "RoleBean [roleId=" + roleId + ", roleName=" + roleName + ", roleState=" + roleState + ", roleRemark="
				+ roleRemark + ", roleDescribe=" + roleDescribe + ", menuBean=" + menuBean + "]";
	}

	
}
