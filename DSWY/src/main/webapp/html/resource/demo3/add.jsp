<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/html/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <base href="<%=basePath%>">
        <title>角色管理</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="css/mine.css" type="text/css" rel="stylesheet">
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"
	charset="utf-8"></script>
    </head>
<script type="text/javascript">
function c(){
	
	 var alls = document.getElementsByName("menu");
	var ch = document.getElementById("checkall");
if (ch.checked) {
	for ( var i = 0; i < alls.length; i++) {
		alls[i].checked = true;
	}
} else {
	for ( var i = 0; i < alls.length; i++) {
		alls[i].checked = false;
	}
}  
}
</script>
    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》角色管理</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="../role/selectRole.do">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="../role/insertRole.do" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">角色编码<span style="color:red">*</span>：</td>
                    <td><input type="text" name="roleId" value="${roleBean.roleId}" /></td>
                </tr>            
                <tr>
                    <td>角色名称<span style="color:red">*</span>：</td>
                    <td> <input type="text" name="roleName" value="${roleBean.roleName}" /> </td>
                </tr>         			
				<tr>
					<td>菜单权限<span style="color: red">*</span>：<br>
					 <input type="checkbox" onChange="c()" id="checkall"/>
					</td>
					<td><c:forEach items="${menus }" var="top">
							<input type="checkbox" name="menu"
								<c:forEach items="${roleMenus }" var="roleMenu">
									<c:if test="${roleMenu.menuId eq top.menuId  }">
					  checked="checked"
                   	 </c:if>
						</c:forEach>
								value="${top.menuId }" />${top.menuName }<br />
							<c:forEach items="${top.menuList }" var="item">
						&nbsp;&nbsp;&nbsp;<input type="checkbox" name="menu"
									<c:forEach items="${roleMenus }" var="roleMenu">
										<c:if test="${roleMenu.menuId eq top.menuId  }">
					  checked="checked"
                    </c:if>
						</c:forEach>
									value="${item.menuId }" />${item.menuName }<br />
							</c:forEach>
						</c:forEach></td>
				</tr>
				<tr>
                    <td>描	述：</td>
                    <td>
                        <textarea name="${roleBean.roleDescribe}"></textarea>
                    </td>                
                </tr>

				<tr>
                    <td>备       注：</td>
                    <td>
                        <textarea name="${roleBean.roleRemark}"></textarea>
                    </td>                
                </tr>
				<tr>
					<td>是否启用：</td>
					<td><select name="roleState">

							<option value="1"
								<c:if test="${roleBean.roleState eq 1 }">selected="selected"</c:if>>是</option>
							<option value="0"
								<c:if test="${roleBean.roleState eq 0 }">selected="selected"</c:if>>否</option>
					</select></td>
				</tr>
				
               <tr>
					<td colspan="2" align="center"><input type="submit" value="添加">
						<input type="reset" value="清空"></td>
				</tr>
            </table>
            </form>
        </div>
    </body>
</html>