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
         <script src="js/jquery-3.2.1.min.js" type="text/javascript"
	charset="utf-8"></script>
         <script language="javascript" type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
    </head>
	
    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》考试管理 -》科目考试管理</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="../exam/selectAll.do">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="../exam/addTo.do" id="form" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">考试编号<span style="color:red">*</span>：</td>
                    <td><input type="text" name="examId" value="${examId}" /></td>
                </tr>
                 <tr>
                 	<td>用户编号<span style="color:red">*</span>：</td>
                 	<td>
                    <select name="userId">
							<option value="0">--请选择--</option>
							<c:forEach items="${userBeans}" var="user">
								<option value="${user.userId}">${user.userId}</option>
							</c:forEach>
					</select>
                	</td>
                </tr>

                <tr>
                    <td>考试科目<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="examName"  /> 
                    </td>
                </tr>
               
                <tr>
                    <td>考试状态<span style="color:red">*</span>：</td>
                    <td>
						<select name="examState">
							<option value="0">--请选择--</option>
							<option value="1">未考试</option>
							<option value="2">考试中</option>
							<option value="3">考试完成</option>
						</select>
					</td>
                </tr>
                <tr>
                    <td>审核状态<span style="color:red">*</span>：</td>
                    <td>
						<select name="examHstate">
							<option value="0">--请选择--</option>
							<option value="1">起草</option>
							<option value="2">待审核</option>
							<option value="3">审核通过</option>
							<option value="4">驳回</option>
						</select>
					</td>
                </tr>
                <tr>
                    <td>考试分值<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="examNumber" />
					</td>
                </tr>
                <tr>
                    <td>考试时间<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="examSubdata"   onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/>
                    </td>
                </tr>
				<tr>
                    <td>申请时间<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="examAppdata"  onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/>
                    </td>
                </tr>
				<tr>
                    <td>考试描述：</td>
                    <td>
                        <input type="text" name="examDescribe" />
                    </td>                
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="添加">
						<input type="reset" value="清空">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>