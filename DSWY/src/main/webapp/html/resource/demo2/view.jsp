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
        <title>用户管理</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：系统管理-》用户管理</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="../user/selectUser.do">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="./admin.php?c=goods&a=add" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">用户编号：</td>
                    <td>
						${user.userId}
					</td>
                </tr>
				<tr>
                    <td width="120px;">登录账号：</td>
                    <td>
						${user.userLogin}
					</td>
                </tr>
                <tr>
                    <td>用户姓名：</td>
                    <td>
						${user.userName}
					</td>
                </tr>
                <tr>
                    <td>密码：</td>
                     <td>
						${user.userPassword}
					</td>
                </tr>
                <tr>
                    <td>用户角色：</td>
                     
					<c:forEach items="${user.roleBean}" var="role">
                        <td>${role.roleName}</td> 
                      </c:forEach>

                </tr>
				<tr>
                    <td>身份证：</td>
                    <td>
                        ${user.userIdentity}
                    </td>                
                </tr>
                <tr>
                    <td>联系电话：</td>
                     <td>
						${user.userPhone}
					</td>
                </tr>


				<tr>
                    <td>邮箱：</td>
                     <td>
						${user.userEmail}
					</td>               
                </tr>

				<tr>
                    <td>联系地址：</td>
                     <td>
						${user.userAddress}
					</td>                
                </tr>

				

            </table>
            </form>
        </div>
    </body>
</html>