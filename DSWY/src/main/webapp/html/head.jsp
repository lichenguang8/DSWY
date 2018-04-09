<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<meta charset="utf-8" />
	 <meta http-equiv=content-type content="text/html; charset=utf-8" />
        <link href="css/admin.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="js/jquery.js"></script>
    </head>
    <body>
        <table cellspacing=0 cellpadding=0 width="100%"  background="img/header_bg.jpg" border=0>
            <tr height=56>
                <td width=520 style="font-size:28px;color:white">
					基于web开发的驾校系统
				</td>
                <td style="font-weight: bold; color: #fff; padding-top: 20px" 
                    >当前用户：${user.userName} &nbsp;&nbsp; 
					<a style="color: #fff"  href="../user/user.do?userBean=${user}"  target=main>刷新</a> 
					&nbsp;&nbsp; 
					<a style="color: #fff"  href="../user/out.do" target=_top>退出系统</a> 
														<!-- onclick="if (confirm('确定要退出吗？')) return true; else return false;"  -->
                </td>
                <td align=right width=268><a href="index.html"><img height=56 
                                               src="img/header_right.jpg" width=268></a></td></tr></table>
        <table cellspacing=0 cellpadding=0 width="100%" border=0>
            <tr bgcolor=#1c5db6 height=4>
                <td></td>
            </tr>
        </table>
    </body>
</html>