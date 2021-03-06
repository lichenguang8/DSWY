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
        <title>科目考试管理添加</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》考试管理 -》科目考试管理</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="../exam/selectAll2.do">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="../exam/addTo.do" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">考试编号<span style="color:red">*</span>：</td>
                    <td><input type="text" name="examId" value="${examBean.examId}" /></td>
                </tr>
                 <tr>
                 	<td>用户编号<span style="color:red">*</span>：</td>
                 	<td> 
						<input type="text" name="userId" value="${examBean.userId}" />							
                	</td>
                </tr>
                <tr>
                    <td>考试科目<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="examName" value="${examBean.examName }" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>考试状态<span style="color:red">*</span>：</td>
                    <td>
                    <select name="examState">
                    	<option <c:if test="${examBean.examState eq 0 }">selected="selected"</c:if>>--请选择--</option>
                    	<option <c:if test="${examBean.examState eq 1 }">selected="selected"</c:if>>未考试</option>
                    	<option <c:if test="${examBean.examState eq 2 }">selected="selected"</c:if>>考试中</option>
                    	<option <c:if test="${examBean.examState eq 3 }">selected="selected"</c:if>>考试完成</option>
                    </select>
					</td>
                </tr>
                <tr>
                    <td>审核状态<span style="color:red">*</span>：</td>
                    <td>
                    <select name="examHstate">
                    	<option <c:if test="${examBean.examHstate eq 0 }">selected="selected"</c:if>>--请选择--</option>
                    	<option <c:if test="${examBean.examHstate eq 1 }">selected="selected"</c:if>>起草</option>
                    	<option <c:if test="${examBean.examHstate eq 2 }">selected="selected"</c:if>>待审核</option>
                    	<option <c:if test="${examBean.examHstate eq 3 }">selected="selected"</c:if>>审核通过</option>
                    	<option <c:if test="${examBean.examHstate eq 4 }">selected="selected"</c:if>>驳回</option>
                    	
                    </select>
					</td>
                </tr>
                <tr>
                    <td>考试分值<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="examNumber" value="${examBean.examNumber }" />
					</td>
                </tr>
                <tr>
                    <td>考试时间<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="examSubdata"  value="${examBean.examSubdata}" />
                    </td>
                </tr>
				<tr>
                    <td>申请时间<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="examAppdata"  value="${ examBean.examAppdata}" />
                    </td>
                </tr>
				<tr>
                    <td>考试描述：</td>
                    <td>
                        <input type="text" name="examDescribe" value="${ examBean.examDescribe}" />
                    </td>                
                </tr>
            </table>
            </form>
        </div>
    </body>
</html>