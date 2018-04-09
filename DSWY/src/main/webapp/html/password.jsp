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
      <head>
        <title>个人信息</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="css/mine.css" type="text/css" rel="stylesheet">
        <script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    </head>
    <script type="text/javascript">
	function f(){
		var password1=$("#1").val();
		var password2=$("#2").val();
		var password3=$("#0").val();
		 if (password3 == null||password3 == "") {
			 alert("请填写原密码");
			 return false;
		}
		 if (password1 == null || password1 == "" || password1 == " ") {
			 alert("密码不能为空");
			 return false;
		}
		if (password1 != password2) {
			 alert("两次密码不同");
			 return false;
		}
		if (ajaxLogin(password3)) {
			return true;
		}
		
		return false;
	}
	function ajaxLogin(obj){
		var userId=$("#id").val();
		var flagAjax="test";
		$.ajax({
    		type:"POST",
    		url:"../user/ajaxOldPaddword.do?userPassword="+obj+"&userId="+userId,
    		async:false,
    		success:function(result) {
    			flagAjax=result;
    		}
    	});
		if (flagAjax == "no") {
			$("#4").html("数据库没有");
					return false;
		}else if(flagAjax == "ok"){
			$("#4").html("数据库有了");
				return true;
		}
		
	}
</script>

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
            <form action="../user/updatePassword.do" method="post" onsubmit="return f();">
            <input type="hidden" name="userId" id="id" value="${user.userId }">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px">原密码：</td>
                    <td>
						<input type="password"  id="0" onblur="ajaxLogin(this.value)"/>
						<span id="4"></span>
					</td>
                </tr>
                <tr>
                    <td>新密码</td>
                    <td>
                        <input type="password" name="userPassword" id="1"/>
                    </td>
                </tr>
                <tr>
                    <td>密码确认：</td>
                    <td>
						<input type="password"  id="2"/>
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