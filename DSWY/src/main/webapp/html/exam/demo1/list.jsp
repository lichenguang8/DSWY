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

        <title>考试管理</title>

        <link href="css/mine.css" type="text/css" rel="stylesheet" />
        <script language="javascript" type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
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
				window.location.href = "../exam/deleteExamAll.do?ids="
						+ ids;

			}
		} else {
			alert("请选中要操作的项");
		}
	}
    </script>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：考试管理-》考试科目管理</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="../exam/addExam.do">【申请】</a>
                    <a style="text-decoration: none;" onClick="delAll()">【删除】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="../exam/selectAll.do" method="get">
                   考试科目: 
					<input type="text"  name="examName" value="${examName}"/>
					 审核状态: 
					<select name="examState">
						<option value="0" 
					<c:if test="${examState eq 0 }">selected="selected"</c:if>
						>--请选择--</option>
						<option value="1" <c:if test="${examState eq 1 }">selected="selected"</c:if> >起草</option>
						<option value="2" <c:if test="${examState eq 2 }">selected="selected"</c:if> >待审核</option>
						<option value="3" <c:if test="${examState eq 3 }">selected="selected"</c:if> >审核通过</option>
						<option value="4" <c:if test="${examState eq 4 }">selected="selected"</c:if> >驳回</option>
					</select>
					考试时间：
					<input type="text" name="starttime" value="${starttime}" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" />至<input type="text" name="endtime" value="${endtime}"  onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/>
                    <input value="查询" type="submit" />
					
                </form>
            </span>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                         <td width="30px;"><input type="checkbox" onChange="checkall()" id="checkall"/></td>							
                        <td width="80px;">用户编号</td>   
						<td>考试科目</td>
						<td>考试日期</td>
						<td>申请日期</td>
						<td>分数值</td>
						<td>科目状态</td>
						<td>审核状态</td>                      
                        <td align="center" width="100px;">操作</td>
                    </tr>
				<c:forEach items="${examBeans}" var="item">
					 <tr id="product1">
                         <td><input type="checkbox" name="check" value="${item.examId}"/></td>
						<td><a href="../user/getById.do?userId=${item.userId}">${item.userId }</a></td>
						<td>${item.examName }</td>
						<td>${item.examSubdata }</td>
						<td>${item.examAppdata }</td>
						<td>${item.examNumber }</td>
						<td>
						<c:choose>
							<c:when test="${item.examState eq 1 }">未考试</c:when>
							<c:when test="${item.examState eq 2 }">考试中</c:when>
							<c:when test="${item.examState eq 3 }">考试完成</c:when>
							<c:otherwise>未选择</c:otherwise>
						</c:choose>
			
						</td>
						<td>
						<c:choose>
							<c:when test="${item.examHstate eq 1}">起草</c:when>
							<c:when test="${item.examHstate eq 2}">待审核</c:when>
							<c:when test="${item.examHstate eq 3}">审核通过</c:when>
							<c:when test="${item.examHstate eq 4}">驳回</c:when>
							<c:otherwise>未选择</c:otherwise>
						</c:choose>
						</td>
						<td>
							<a href="../exam/update.do?examId=${item.examId}">修改</a>	
							<a href="../exam/select.do?examId=${item.examId}">明细</a>
							<a href="javascript:if(confirm('您确定要删除当前档案状态？')){location.href='../exam/examDel.do?examId=${item.examId}'};">删除</a>
							<c:if test="${item.examHstate eq 1}"><a href="../exam/updateState.do?examId=${item.examId}">提交</a></c:if>
						</td>
                    </tr>
				</c:forEach>	
                    <tr>
                        <td colspan="20" style="text-align: center;">						
     <c:if test="${page.pageNum  == 1}">
             首页&nbsp;&nbsp;&nbsp;&nbsp;
	    上一页&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
	<c:if test="${page.pageNum > 1 }">
    <a href="../exam/selectAll.do?pageNum=1&pmagName=${pmagName }&examState=${examState}&examName=${examName }&starttime=${starttime }&endtime=${endtime }">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="../exam/selectAll.do?pageNum=${page.pageNum - 1 }&examState=${examState}&examName=${examName}&starttime=${starttime }&endtime=${endtime }">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
	
	 <c:if test="${page.pageNum == page.totlePages}">
	 下一页&nbsp;&nbsp;&nbsp;&nbsp;
	 尾页&nbsp;&nbsp;&nbsp;&nbsp;
	 </c:if>
	 
	 <c:if test="${page.pageNum != page.totlePages }"> 
	<a href="../exam/selectAll.do?pageNum=${page.pageNum + 1 }&examState=${examState}&examName=${examName }&starttime=${starttime}&endtime=${endtime}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="../exam/selectAll.do?pageNum=${page.totlePages }&examState=${examState}&examName=${examName }&starttime=${starttime }&endtime=${endtime }">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;
	 </c:if>
	 当前页 ${page.pageNum }&nbsp;&nbsp;&nbsp;&nbsp;
	分页单位${page.pageRows }&nbsp;&nbsp;&nbsp;&nbsp;
	总页数${page.totlePages }&nbsp;&nbsp;&nbsp;&nbsp; 
	总条数${page.totleRows } 
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>