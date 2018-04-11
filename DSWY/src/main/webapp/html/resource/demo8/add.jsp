<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/html/";
%>

<!DOCTYPE html>
<html>

<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	 <title>菜单管理</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="css/mine.css" type="text/css" rel="stylesheet">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
</head>
	<script type="text/javascript">
	
	</script>
    <body >

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》菜单管理</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="../menu/selectMenu.do">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="../menu/insertMenu.do" method="post" >
            <input type="hidden" name="menuId" value="${menuBean.menuId }">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">菜单名称<span style="color:red">*</span>：</td>
                    <td><input type="text" required="required" name="menuName" value="${menuBean.menuName}" /></td>
                </tr>
                <tr>
                    <td>上级菜单<span style="color:red">*</span>：</td>
                    <td>
                       <select name="topId" id="topId" >
						<option value="0">顶级菜单</option>
						<c:forEach items="${topMenus }" var="item">
						<option value="${item.menuId }"  <c:if test="${item.menuId eq menuBean.menuId }">selected="selected"</c:if> >${item.menuName}</option>
						</c:forEach>
					   </select>
                    </td>
                </tr>
				  <tr>
                    <td>URL<span style="color:red">*</span>：</td>
                    <td>
						<input type="text"  name="menuUrl" value="${ menuBean.menuUrl}" />
					</td>
                </tr>
               
                <tr>
                    <td>状态<span style="color:red">*</span>：</td>
                    <td>
						 <select name="menuState">
							<option value="1" <c:if test="${menuBean.menuState eq 1 }">selected="selected"</c:if> >启用</option>
							<option value="0"<c:if test="${menuBean.menuState eq 0 }">selected="selected"</c:if>>禁用</option>						
						 </select>
					</td>
                </tr>
                <tr>
                    <td>备注：</td>
                    <td>
						<input type="text"  name="menuRemark" value="${menuBean.menuRemark }" />
					</td>
                </tr>
              


				
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="提交">
						<input type="reset" value="清空">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>