<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

        <title>车辆分配情况</title>

        <link href="css/mine.css" type="text/css" rel="stylesheet" />
    </head>
         <script type="text/javascript">
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
				ids.push("ids=" + alls[i].value);
			}
		}
		var params = ids.join("&");
		if (ids.length > 0) {
			if (confirm("确认操作?")) {
				window.location.href = "../uv/deleteAll.do?"+params;
			}
		} else {
			alert("请选中要操作的项");
		}
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
	  		
	  		location.href="../vehicle/selectAll.do?vehicleName=${vehicle.vehicleName}&vehicleStyle=${vehicle.vehicleStyle}&currentNum="+currentNum;
	  	}
	  function excl() {
  		var alls = document.getElementsByName("check");
  		var ids = new Array();
  		for ( var i = 0; i < alls.length; i++) {
  			if (alls[i].checked) {
  				ids.push("ids=" + alls[i].value);
  			}
  		}
  		var params = ids.join("&");
  		if (ids.length > 0) {
  			if (confirm("确认导出?")) {
  				window.location.href = "../uv/excl.do?"+params;
  			}
  		} else {
  			alert("请选中要导出的项");
  		}
	  }
 </script>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：车辆管理-》车辆分配</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                  	<a style="text-decoration: none;" href="payment_add.html">【分配】</a>
					<a style="text-decoration: none;" onClick="delAll()">【删除】</a>
					<a style="text-decoration: none;" onClick="excl()">【excl】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="../uv/select.do" method="post">
                    用户姓名: 
					<input type="text" name="userName" value="${userNme}"/>
                    分配状态: 
					<select name="uvState">
						<option value="0" <c:if test="${uvState eq 0}">selected="selected"</c:if>>-- 请选择--</option>
						<option value="1" <c:if test="${uvState eq 1}">selected="selected"</c:if>>已分配</option>
						<option value="2" <c:if test="${uvState eq 2}">selected="selected"</c:if>>未分配</option>
					</select>                  
                    <input value="查询" type="submit" />
					
                </form>
            </span>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                        <td width="30px;"><input type="checkbox" onChange="checkall()" id="checkall"/></td>								
                        <td width="100px;">用户编号</td>
                        <td width="100px;">用户姓名</td>                       
						<td width="150px;">车辆编号</td>
						<td width="200px;">车辆名称</td>
						<td width="240px;">分配日期</td>
						<td width="150px;">状态</td>    
						<td >操作</td>						
                        
                    </tr>
					<c:forEach items="${uvs}"  var="uv">
						<tr id="product1">
	                         <td><input type="checkbox" name="check" value="${uv.vehicleId}"/></td>						
	                        <td>${uv.userId }</td>
	                        <td>${uv.userName}</td>                       
							<td>${uv.vehicleId}</td> 
							<td>${uv.vehicleName}</td>   
							<td>${uv.uvDate}</td>
							<td>
								<c:choose>
									<c:when test="${uv.uvState eq 1 }">已分配</c:when>
									<c:when test="${uv.uvState eq 2 }">未分配</c:when>
									<c:otherwise>未选择</c:otherwise>
								</c:choose>
							</td>    
							<td>				   
								<a href="../uv/deleteId.do?vehicleId=${uv.vehicleId}">删除</a>
								<c:if	test="${uv.uvState eq 1 }">
									<a href="">暂停</a>
									<a href="">重新分配</a>
								</c:if>
								<c:if test="${uv.uvState eq 2}">
									<a href="">启用</a>
								</c:if>
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