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

        <title>车辆信息管理</title>

        <link href="css/mine.css" type="text/css" rel="stylesheet" />
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"
		charset="utf-8"></script>
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
				window.location.href = "../vehicle/deleteAll.do?"+params;
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
 </script>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：车辆管理-》车辆信息管理</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="../vehicle/add.do">【添加】</a>
					<a style="text-decoration: none;" onClick="delAll()">【删除】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
              <input type="hidden" id="currentNum" name="currentNum"  value="${currentPage }" >
                <form action="../vehicle/selectAll.do"  method="post">
                    车辆名称: 
					<input type="text"  name="vehicleName" value="${vehicle.vehicleName}"/>
					 车辆类型: 
					<select name="vehicleStyle">
						<option value="0" <c:if test="${vehicle.vehicleStyle eq 0}">selected="selected"</c:if>>-- 请选择--</option>
						<option value="1" <c:if test="${vehicle.vehicleStyle eq 1}">selected="selected"</c:if>>--客车--</option>
						<option value="2" <c:if test="${vehicle.vehicleStyle eq 2}">selected="selected"</c:if>>--货车--</option>
						<option value="3" <c:if test="${vehicle.vehicleStyle eq 3}">selected="selected"</c:if>>--汽车--</option>
					</select>
					   <input value="查询" type="submit" />
                </form>
            </span>
        </div>
        
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                         <td width="30px;"><input type="checkbox" onChange="checkall()" id="checkall"/></td>								
                        <td width="80px;">车辆编号</td>
                        <td width="100px;">车辆名称</td>
                        <td width="80px;">车辆类型</td>
						<td width="100px;">发动机号</td>
                        <td width="120px;">购车时间</td> 
                        <td width="80px;">车辆状态</td>                      
                        <td align="center" width="100px;">操作</td>
                    </tr>


                   
                    <c:forEach	items="${vehicleBeans}" var="item">
                     <tr id="product1">
                    	  <td><input type="checkbox" name="check" value="${item.vehicleId}"/></td>
						<td>${item.vehicleId }</td>
						<td><a href="../vehicle/view.do?vehicleId=${item.vehicleId}">${item.vehicleName}</a></td>
                        <td>
                        <c:choose>
							<c:when test="${item.vehicleStyle eq 1 }">客车</c:when>
							<c:when test="${item.vehicleStyle eq 2 }">货车</c:when>
							<c:when test="${item.vehicleStyle eq 3 }">汽车</c:when>
							<c:otherwise>未选择</c:otherwise>
						</c:choose>
                        </td> 
						<td>${item.vehicleNumber}</td> 						
                        <td>${item.vehicleBdata}</td>
                        <td> 
	                       	<c:choose>
								<c:when test="${item.vehicleState eq 1 }">正常使用</c:when>
								<c:when test="${item.vehicleState eq 2 }">修理</c:when>
								<c:when test="${item.vehicleState eq 3 }">已报废</c:when>
								<c:otherwise>未选择</c:otherwise>
							</c:choose>
                   		</td>
                        <td>				   
							<a href="../vehicle/deleteO.do?vehicleId=${item.vehicleId}">删除</a>
							<c:if	test="${item.vehicleState eq 1 }">
								<a href="../vehicle/updateX.do?vehicleId=${item.vehicleId}">修理</a>
							</c:if>
							<c:if test="${item.vehicleState eq 2 }">
								<a href="../vehicle/updateQ.do?vehicleId=${item.vehicleId}">启用</a>
								<a href="../vehicle/updateB.do?vehicleId=${item.vehicleId}">报废</a>
							</c:if>
						</td>   
						</tr>                  
                    </c:forEach>
                   
					
                     <tr>
                       

      				<td colspan="20" style="text-align: center;">
                        					
						${maxSize } 条记录 ${currentPage }/${pageNum } 页  
         <a href='javascript:nextpage("first");'>首页</a>
         <c:if test="${currentPage gt 1 }"><a href='javascript:nextpage("forhead");'>上一页</a></c:if>
         <c:if test="${currentPage le 1 }"><a style="color:gray;">上一页</a></c:if>
         <c:choose>
         	<c:when test="${currentPage le 3 }">
         		<c:if test="${currentPage eq 1 }">
         			<span class='current'>${currentPage }</span>
         			<c:if test="${pageNum ge 5 }">
         				<c:forEach begin="${currentPage+1 }" end="${currentPage+4 }" var="i">
         				<a href='javascript:nextpage(${i});'>${i }</a>
         				</c:forEach>
         			</c:if>
         			<c:if test="${pageNum lt 5 }">
         				<c:forEach begin="${currentPage+1 }" end="${pageNum }" var="i">
         					<a href='javascript:nextpage(${i});'>${i }</a>
         				</c:forEach>
         			</c:if>
         		</c:if>
         		<c:if test="${currentPage eq 2 }">
         			<c:if test="${pageNum ge 5 }">
         				<c:forEach begin="${currentPage-1 }" end="${currentPage+3 }" var="i">
         					<c:if test="${i eq currentPage }">
         						<span class='current'>${currentPage }</span>
         					</c:if>
         					<c:if test="${i ne currentPage }">
         						<a href='javascript:nextpage(${i});'>${i }</a>
         					</c:if>
         				</c:forEach>
         			</c:if>
         			<c:if test="${pageNum lt 5 }">
         				<c:forEach begin="${currentPage-1 }" end="${pageNum }" var="i">
         					<c:if test="${i eq currentPage }">
         						<span class='current'>${currentPage }</span>
         					</c:if>
         					<c:if test="${i ne currentPage }">
         						<a href='javascript:nextpage(${i});'>${i }</a>
         					</c:if>
         				</c:forEach>
         			</c:if>
         		</c:if>
         		<c:if test="${currentPage eq 3 }">
         			<c:if test="${pageNum ge 5 }">
         				<c:forEach begin="${currentPage-2 }" end="${currentPage+2 }" var="i">
         					<c:if test="${i eq currentPage }">
         						<span class='current'>${currentPage }</span>
         					</c:if>
         					<c:if test="${i ne currentPage }">
         						<a href='javascript:nextpage(${i});'>${i }</a>
         					</c:if>
         				</c:forEach>
         			</c:if>
         			<c:if test="${pageNum lt 5 }">
         				<c:forEach begin="${currentPage-2 }" end="${pageNum }" var="i">
         					<c:if test="${i eq currentPage }">
         						<span class='current'>${currentPage }</span>
         					</c:if>
         					<c:if test="${i ne currentPage }">
         						<a href='javascript:nextpage(${i});'>${i }</a>
         					</c:if>
         				</c:forEach>
         			</c:if>
         		</c:if>
         	</c:when>
         	<c:otherwise>
         		<c:if test="${currentPage lt pageNum-2 }">
         			<c:forEach begin="${currentPage-2 }" end="${currentPage+2 }" var="i">
         				<c:if test="${i eq currentPage }">
         					<span class='current'>${currentPage }</span>
         				</c:if>
         				<c:if test="${i ne currentPage }">
         					<a href='javascript:nextpage(${i});'>${i }</a>
         				</c:if>
         			</c:forEach>
         		</c:if>
         		<c:if test="${currentPage ge pageNum-2 }">
         			<c:if test="${pageNum ge 5 }">
         				<c:forEach begin="${pageNum-4 }" end="${pageNum }" var="i">
         				<c:if test="${i eq currentPage }">
         					<span class='current'>${currentPage }</span>
         				</c:if>
         				<c:if test="${i ne currentPage }">
         					<a href='javascript:nextpage(${i});'>${i }</a>
         				</c:if>
         			</c:forEach>
         			</c:if>
         			<c:if test="${pageNum lt 5 }">
         			<c:forEach begin="${pageNum-3 }" end="${pageNum }" var="i">
         				<c:if test="${i eq currentPage }">
         					<span class='current'>${currentPage }</span>
         				</c:if>
         				<c:if test="${i ne currentPage }">
         					<a href='javascript:nextpage(${i});'>${i }</a>
         				</c:if>
         			</c:forEach>
         			</c:if>	
         		</c:if>
         	</c:otherwise>
         </c:choose> 
         <c:if test="${currentPage lt pageNum }"><a href='javascript:nextpage("next");'>下一页</a></c:if>
         <c:if test="${currentPage ge pageNum }"><a style="color:gray;">下一页</a></c:if> 
         <a href='javascript:nextpage("last");' >尾页</a>
         
         
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>