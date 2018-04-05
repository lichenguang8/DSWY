<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <meta http-equiv=content-type content="text/html; charset=utf-8" />
        <link href="css/admin.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <table cellspacing=0 cellpadding=0 width="100%" align=center border=0>
            <tr height=28>
                <td background=./img/title_bg1.jpg>当前位置: </td></tr>
            <tr>
                <td bgcolor=#b1ceef height=1></td></tr>
            <tr height=20>
                <td background=./img/shadow_bg.jpg></td></tr></table>
        <table cellspacing=0 cellpadding=0 width="90%" align=center border=0>
            <tr height=100>
                <td align=middle width=100>
					<img height=100 src="./img/admin_p.gif"  width=90>
				</td>
                <td width=60>&nbsp;</td>
                <td>
                    <table height=100 cellspacing=0 cellpadding=0 width="100%" border=0>

                        <tr>
                         <td>当前时间：2008-12-27 17:03:55</td>
						</tr>
                        <tr>
                            <td style="font-weight: bold; font-size: 16px">admin</td>
						</tr>
                        <tr>
                            <td>欢迎进入网站管理中心！</td></tr></table></td>
						</tr>
            <tr>
         <td colspan=3 height=10></td></tr></table>
        <table cellspacing=0 cellpadding=0 width="95%" align=center border=0>
            <tr height=20>
                <td></td></tr>
            <tr height=22>
                <td style="padding-left: 20px; font-weight: bold; color: #ffffff" 
                    align=middle background=./img/title_bg2.jpg>个人信息</td></tr>
            <tr bgcolor=#ecf4fc height=12>
                <td></td></tr>
            <tr height=20>
                <td></td></tr></table>
        <table cellspacing=0 cellpadding=2 width="95%" align=center border=0>
            <tr>
                <td align=right width=100>登陆帐号：</td>
                <td style="color: #880000">admin</td></tr>
            <tr>
                <td align=right>真实姓名：</td>
                <td style="color: #880000">admin</td></tr>
            <tr>
                <td align=right>注册时间：</td>
                <td style="color: #880000">2007-7-25 15:02:04</td></tr>
            <tr>
                <td align=right>登陆次数：</td>
                <td style="color: #880000">58</td></tr>
            <tr>
                <td align=right>上线时间：</td>
                <td style="color: #880000">2008-12-27 17:02:54</td></tr>
            <tr>
                <td align=right>ip地址：</td>
                <td style="color: #880000">222.240.172.117</td></tr>
            <tr>
                <td align=right>身份过期：</td>
                <td style="color: #880000">30 分钟</td>
			</tr>
        </table>		
<!-- <div style="text-align:center;">
<p>维护信息：<a href="http://www.zparkedu.com" target="_blank">薪火华扬（北京）科技有限公司</a></p>
<p>联系电话：<a href="http://www.zparkedu.com" target="_blank">17710208155</a></p>
</div> -->
    </body>
</html>