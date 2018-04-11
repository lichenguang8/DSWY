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
        <link href="../../css/mine.css" type="text/css" rel="stylesheet">
    </head>

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
            <form action="./admin.php?c=goods&a=add" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">角色编码：</td>
                    <td>
					${role.roleId }
					</td>
                </tr>
                <tr>
                    <td>角色名称：</td>
                    <td>
						${role.roleName}
					</td>
                </tr>    
                <tr>
                    <td>角色描述：</td>
                     <td>
						${role.roleDescribe }
					</td>
                </tr>
                 <tr>
                    <td>备  注：</td>
                     <td>
						${role.roleDescribe }
					</td>
                </tr>
                <tr>
                    <td>备  注：</td>
                     <td>
						${role.roleRemark }
					</td>
                </tr>


				<tr>
                    <td>是否启用：</td>
                     <td>
						${role.roleState }
					</td>               
                </tr>

				
            </table>
            </form>
        </div>
    </body>
</html>