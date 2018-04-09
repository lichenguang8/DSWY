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
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

       <title>用户管理</title>

        <link href="css/mine.css" type="text/css" rel="stylesheet" />
        <meta name="viewport"
		content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<script src="js/jquery-3.2.1.min.js" type="text/javascript"
		charset="utf-8"></script>
    </head>
    
    <script type="text/javascript">
    	function selectrole(obj){
    		
    		$.post("../role/ajaxRole.do",{deptId:obj},function(result){
    			 var role = document.getElementById("roleId"); 
    			 role.innerHTML="";
    			 role.add(new Option("--请选择--",-1),null);
    			
    			for ( var sss in result) {
					
    			 role.add(new Option(result[sss].roleName,result[sss].roleId),null);
				}
    			
    			
    		
    		});
    		
    	}
    	//分页函数
    	//pageNum:最大页数
    	//maxSize：最大条数
    	//currentPage ：当前多少页
    	function nextpage(obj){
    			//alert(obj);
    			//var select1 = parseInt(document.getElementById("select1").value);
    			var currentNum = parseInt(document.getElementById("currentNum").value);
    			
    			if(obj=="forhead"){
    				currentNum = currentNum-1;
    			}
    			else if(obj=="next"){
    				currentNum = currentNum+1;
    			}
    			else if(obj=="first"){
    				currentNum =1;
    			}
    			else if(obj=="last"){
    				currentNum=parseInt("${pageNum}");
    			}
    			else {
    				currentNum=obj;
    			}
    			//alert(currentNum);
    			
    			location.href="../user/selectUser.do?userName=${userName}&deptId=${deptId}&roleId=${roleId}&currentNum="+currentNum;
    		}
    	function checkall() {
    		var alls = document.getElementsByName("check");
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
    	function delAll() {
    		var alls = document.getElementsByName("check");
    		var ids = new Array();
    		for ( var i = 0; i < alls.length; i++) {
    			if (alls[i].checked) {
    				ids.push(alls[i].value);
    			}
    		}
    		if (ids.length > 0) {
    			if (confirm("确认操作?")) {
    				window.location.href = "../user/deleteUserAll.do?ids="
    						+ ids;

    			}
    		} else {
    			alert("请选中要操作的项");
    		}
    	}
    	function excl() {
    		var alls = document.getElementsByName("check");
    		var ids = new Array();
    		for ( var i = 0; i < alls.length; i++) {
    			if (alls[i].checked) {
    				ids.push(alls[i].value);
    			}
    		}
    		if (ids.length > 0) {
    			if (confirm("确认导出?")) {
    				window.location.href = "../user/excl.do?ids="
    						+ ids;
    			}
    		} else {
    			alert("请选中要导出的项");
    		}
    	}
    </script>
    
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
    <body>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：系统管理-》用户管理</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="/resource/demo2/add.jsp">【添加】</a>
					<a style="text-decoration: none;" onClick="delAll()">【删除】</a>
					<a style="text-decoration: none;" onClick="excl()">【excl】</a>
                </span>
            </span>
        </div>
        
        <div></div>
        <div class="div_search">
           
                <c:choose>
                <c:when test=""></c:when>
                <c:otherwise></c:otherwise>
                </c:choose>
                 <input type="hidden" id="currentNum" name="currentNum"  value="${currentPage }" >
                <form id=form action="../user/selectUser.do" method="post">
               
                 <input type="hidden"  name="currentNum"   value="1" >
               
                  	   姓名：
					<input type="text" id=userName  name="userName" value="${userName }" />
					 角色: 
					  
                        <select name="roleName" id="roleName" >                    
                        		<option value="">--请选择--</option>                    	
							<c:forEach items="${roles}" var="role">
								<option value="${role.roleId}">${role.roleName}</option>
							</c:forEach>
						</select>         
                    <input value="查询" type="submit" />
                </form>
           
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody>
					<tr style="font-weight: bold;">						
                        <td width="40px;">序号</td>
                        <td width="30px;"><input type="checkbox" /></td>						
						<td width="80px;">账号</td>
                        <td width="80px;">姓名</td>
                        <td >角色</td>
						<td width="100px;">状态</td>                                        
                        <td align="center" width="100px;">操作</td>
                    </tr>
                   <c:forEach items="${userBeans}" var="item">
                   		<tr id="product1">
                        <td>1</td>
                        <td><input type="checkbox" /></td>
						<td>"${item.userLogin}"</td>
                        <td><a href="../user/getById.do?userId=${item.userId}">"${item.userName}"</a></td> 
                        <c:forEach items="${item.roleBean}" var="role">
                        <td>"${role.roleName}"</td> 
                        </c:forEach>
						<td>"${item.userState}"</td> 						                        
                        <td>
							<a href="add.html">修改</a>						   
							<a href="#">删除</a>
						</td>                        
                    </tr> 
                   </c:forEach>
                    <tr>
                        <td colspan="20" style="text-align: center;">						
						<a style="text-decoration: none;" href="#">
                            首页 上一页  ... 7 8 9 10 11 12 ... 下一页 尾页 共1234条 每页显示 10/23 </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>