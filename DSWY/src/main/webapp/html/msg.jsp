<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path +"/html/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <base href="<%=basePath%>">
        <title>个人信息</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="css/mine.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
        <script type="test/javascript" src="My97DatePicker/WdatePicker.js"></script>
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：工作平台-》个人信息</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="./admin.php?c=goods&a=showlist">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="../user/updateUser.do" method="post" enctype="multipart/form-data">
           <input type="hidden" name="userId" value="${user.userId}">
            <table border="1" width="100%" class="table_a">
            	
                <tr>
                    <td width="120px">姓名</td>
                    <td>
						<input type="text" name="userName" value="${user.userName}" />
						<input type="hidden" name="userLogin" value="${user.userLogin }"/>
						<input type="hidden" name="userPassword" value="${user.userPassword }"/>
					</td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td>
                       	<input type="radio" name="userSex" <c:if test="${user.userSex eq 1 }">checked</c:if> value="1"/>男 <input type="radio" name="sex" <c:if test="${user.userSex eq 0 }">checked</c:if>  value="0"/>女 
                   		
                    </td>
                </tr>
               <tr>
                    <td width="120px">年龄</td>
                    <td>
						<input type="text" name="userGender" value="${user.userGender}" />
					</td>
                </tr>
                <tr>
                    <td>身份证号：</td>
                    <td>
						<input type="text" name="userIdentity" value="${user.userIdentity}"/>
					</td>
                </tr>
                <tr>
                    <td>出生日期：</td>
                    <td>
						<input type="text" name="userData" value="${user.userData}" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/>
					</td>
                </tr>
                <tr>
                    <td>手机：</td>
                    <td>
                       	<input type="text" name="userPhone" value="${user.userPhone}" />
                    </td>
                </tr>
				<tr>
                    <td>邮箱：</td>
                    <td>
                        	<input type="text" name="userEmail" value="${user.userEmail}"/>
                    </td>
                </tr>
				<tr>
                    <td>更换头像：</td>
                    <td>
						<input type="file" name="file" />
					</td>
                </tr>
				<tr>
                    <td>备注：</td>
                    <td>
                        <textarea name="userRemark" value="${user.userRemark}"></textarea>
                    </td>
                </tr>
                
				
				
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="修改">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>