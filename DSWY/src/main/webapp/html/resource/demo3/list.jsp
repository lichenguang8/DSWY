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

        <title>角色管理</title>

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
				ids.push(alls[i].value);
			}
		}
		if (ids.length > 0) {
			if (confirm("确认操作?")) {
				window.location.href = "../role/deleteRoleAll.do?ids="
						+ ids;

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
  		
  		location.href="../role/selectRole.do?roleName=${roleName}&roleState=${roleState}&currentNum="+currentNum;
  	}
    </script>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：系统管理-》角色管理</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="../role/addRole.do">【添加】</a>
					<a style="text-decoration: none;" onClick="delAll()">【删除】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
			   <input type="hidden" id="currentNum" name="currentNum"  value="${currentPage }" >
            
                <form action="../role/selectRole.do" method="post">
                   角色名称: 
					<input type="text" name="roleName" value="${roleName}"/>
					是否启用: 
					<select name ="roleState" id="roleState">
						<option value="-1">---请选择---</option>
						<option value="1" <c:if test="${role.roleState eq 1 }">selected="selected"</c:if> >是</option>
						<option value="0" <c:if test="${role.roleState eq 0 }">selected="selected"</c:if> >否</option>
					</select>
                    <input value="查询" type="submit" />
					
                </form>
            </span>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
               
                        <td width="30px;"><input type="checkbox" onChange="checkall()" id="checkall"/></td>						
                        <td width="80px;"> 角色编号</td>
                        <td >角色名称</td>                    
						<td width="120px;">状态</td>  
                        <td align="center" width="100px;">操作</td>
                    </tr>
					<c:forEach items="${roleBeans}" var="item">
					<tr id="product1">      
                        <td><input type="checkbox" name="check" value="${item.roleId }"/></td>	
                        <td>${ item.roleId}</td>
                        <td><a href="../role/getRoleId.do?roleId=${item.roleId}">${item.roleName }</a></td> 						
						<td>
							<c:choose>
							<c:when test="${item.roleState  eq 1 }">启用</c:when>
							<c:otherwise>禁用</c:otherwise>
							</c:choose>
							
						</td>
                        <td>
							<a href="../role/updateRole.do?roleId=${item.roleId }">修改</a>						   
							<c:choose>
							<c:when test="${item.roleState eq 1 }">
								<a href="../role/noDeleteRole.do?roleId=${item.roleId }">禁用</a>
							</c:when>
							<c:otherwise>
							<a href="../role/deleteRole.do?roleId=${item.roleId }" onclick="return confirm('确认删除？')">删除</a>
							</c:otherwise>
							</c:choose>
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