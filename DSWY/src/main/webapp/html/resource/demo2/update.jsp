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
        <link href="../html/css/mine.css" type="text/css" rel="stylesheet">
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"
		charset="utf-8"></script>
    </head>
    <script type="text/javascript">
    
    	function update(){
    		var user=$("#userId").val();
    		console.log(userId);
    		var alls = document.getElementsByName("roleId");
    		var ids = new Array();
    		for ( var i = 0; i < alls.length; i++) {
    			if (alls[i].checked) {
    				ids.push("ids=" + alls[i].value);;
    			}
    		}
    		
    		var userId="userId="+parseInt(user);
    		var params = ids.join("&");
    		console.log(ids);
    			if (confirm("确认角色?")) {
    				console.log("../userR/userR.do?"+userId+"&"+params);
    				window.location.href = "../user/userR.do?"+userId+"&"+params;
    	
    			}   		
    	}
    	
    </script>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》系统管理》用户管理</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="../user/selectUser.do">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="../user/update.do" id=form method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">用户编号<span style="color:red">*</span>：</td>
                    <td><input type="text" name="userId" value="${user.userId}" id="userId" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td>登录账号<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="userLogin" readonly="readonly" value="${user.userLogin }" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>用户姓名<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="userName" readonly="readonly" value="${user.userName }" /></td>
                </tr>
                <tr>
                    <td>密码<span style="color:red">*</span>：</td>
                    <td>
						<input type="text"  name="userPassword" readonly="readonly" value="${user.userPassword }" />
					</td>
                </tr>
				<tr>
                    <td>身份证<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="userIdentity" readonly="readonly" value="${user.userIdentity }" />
                    </td>                
                </tr>

				<tr>
                    <td>联系电话<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="userPhone" readonly="readonly" value="${user.userPhone}"/>
                    </td>                
                </tr>

				<tr>
                    <td>邮箱<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="userEmail" readonly="readonly" value="${user.userEmail}" />
                    </td>                
                </tr>

				<tr>
                    <td>联系地址：</td>
                    <td>
                        <input type="text" name="userAddress"  readonly="readonly" value="${user.userAddress}" />
                    </td>                
                </tr>
                <tr>
                    <td>角色：</td>
                     <td>
                     <c:forEach items="${roles}" var="role">
							<input type="checkbox" value="${role.roleId}" name="roleId">${role.roleName}
					</c:forEach>
					</td>                
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button  onclick="update()">修改</button>
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>