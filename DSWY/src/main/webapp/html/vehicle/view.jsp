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
        <title>车辆信息管理查看修改</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="css/mine.css" type="text/css" rel="stylesheet">
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"
	charset="utf-8"></script>
        <script language="javascript" type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
 </head>
    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》车辆信息管理》查看修改</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="../vehicle/selectAll.do">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="../vehicle/update.do" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">车辆编号<span style="color:red">*</span>：</td>
                    <td><input type="text" name="vehicleId"  readonly value="${vehicle.vehicleId}"/></td>
                </tr>
                <tr>
                    <td width="120px;">车辆名称<span style="color:red">*</span>：</td>
                    <td><input type="text" name="vehicleName" value="${vehicle.vehicleName }"/></td>
                </tr>
                <tr>
                    <td>车辆分类<span style="color:red">*</span>：</td>
                    <td>
                       <select name="vehicleStyle">
						<option value="0" <c:if test="${vehicle.vehicleStyle eq 0}">selected="selected"</c:if>>-- 请选择--</option>
						<option value="1" <c:if test="${vehicle.vehicleStyle eq 1}">selected="selected"</c:if>>--客车--</option>
						<option value="2" <c:if test="${vehicle.vehicleStyle eq 2}">selected="selected"</c:if>>--货车--</option>
						<option value="3" <c:if test="${vehicle.vehicleStyle eq 3}">selected="selected"</c:if>>--汽车--</option>
						</select>
                    </td>
                </tr>
               
                <tr>
                    <td>发动机号<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="vehicleNumber" value="${vehicle.vehicleNumber}"/>
					</td>
                </tr>
                <tr>
                    <td>购买时间<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="vehicleBdata"  value="${vehicle.vehicleBdata }" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/>
					</td>
                </tr>
				<tr>
                    <td>车辆状态<span style="color:red">*</span>：</td>
                    <td>
                        <select name="vehicleState"> 
						<option value="0" <c:if test="${vehicle.vehicleState eq 0}">selected="selected"</c:if>>-- 请选择--</option>
						<option value="1" <c:if test="${vehicle.vehicleState eq 1}">selected="selected"</c:if>>正常使用</option>
						<option value="2" <c:if test="${vehicle.vehicleState eq 2}">selected="selected"</c:if>>修理</option>
						<option value="3" <c:if test="${vehicle.vehicleState eq 3}">selected="selected"</c:if>>已报废</option>
						</select>
                    </td>                
                </tr>
				<tr>
                    <td>备注：</td>
                    <td>
                        <input type="text" name="vehicleDec" value="${vehicle.vehicleDec}"/>
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