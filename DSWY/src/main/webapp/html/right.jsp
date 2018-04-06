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
        <script type="text/javascript" src="js/jquery.js"></script>
    </head>
   <script language="javascript">

     var t = null;

    t = setTimeout(time,1000);//开始执行

    function time()

    {

       clearTimeout(t);//清除定时器

       dt = new Date();

var y=dt.getYear()+1900;

var mm=dt.getMonth()+1;

var d=dt.getDate();

var weekday=["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];

var day=dt.getDay();

       	var h=dt.getHours();

       	var m=dt.getMinutes();

       	var s=dt.getSeconds();

if(h<10){h="0"+h;}

if(m<10){m="0"+m;}

if(s<10){s="0"+s;}

       	document.getElementById("timeShow").innerHTML =  "当前时间："+y+"年"+mm+"月"+d+"日"+weekday[day]+"  "+h+":"+m+":"+s+"";

       	t = setTimeout(time,1000); //设定定时器，循环执行           

    }

  </script>
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
                         <td><div id="timeShow" class="time1"></div></td>
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
                <td style="color: #880000">"${user.userLogin }"</td></tr>
            <tr>
                <td align=right>真实姓名：</td>
                <td style="color: #880000">"${user.userName }"</td></tr>
            <tr>
                <td align=right>年龄：</td>
                <td style="color: #880000">"${user.userGender}"</td></tr>
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
                <td align=right>身份证：</td>
                <td style="color: #880000">"${user.userIdentity}"</td>
			</tr>
        </table>		
    </body>
</html>