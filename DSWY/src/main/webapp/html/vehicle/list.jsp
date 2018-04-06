<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

        <title>车辆信息管理</title>

        <link href="../css/mine.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：车辆管理-》车辆信息管理</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="standard_add.html">【添加】</a>
					<a style="text-decoration: none;" href="#">【删除】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="#" method="get">
                    车辆编号: 
					<input type="text"  />
					 车辆类型: 
					<select>
						<option>-- 请选择--</option>
						<option>-- 起草--</option>
						<option>-- 审核中--</option>
						<option>-- 已通过--</option>
					</select>
					   <input value="查询" type="submit" />
                </form>
            </span>
        </div>
        
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                        <td width="40px;">序号</td>
                        <td width="30px;"><input type="checkbox" /></td>						
                        <td width="80px;">车辆编号</td>
                        <td >车辆类型</td>
						<td width="100px;">发动机号</td>
                        <td width="120px;">购车时间</td>                       
                        <td align="center" width="100px;">操作</td>
                    </tr>


                    <tr id="product1">
                        <td>1</td>
                        <td><input type="checkbox" /></td>
						<td>a1001</td>
                        <td><a href="standard_view.html">研发工程师</a></td> 
						<td>起草</td> 						
                        <td>2012-10-18 17:40</td>
                        <td>
							<a href="standard_add.html">修改</a>						   
							<a href="#">删除</a>
						</td>                        
                    </tr> 
					 <tr id="product1">
                        <td>2</td>
                        <td><input type="checkbox" /></td>
						<td>b1002</td>
                        <td><a href="standard_view.html">实施工程师</a></td> 
						<td>审核中</td> 						
                        <td>2012-10-18 17:40</td>
                        <td>
												   							
						</td>                        
                    </tr>
					
					 <tr id="product1">
                        <td>3</td>
                        <td><input type="checkbox" /></td>
						<td>a1002</td>
                        <td><a href="standard_view.html">项目经理</a></td> 
						<td>未通过</td> 						
                        <td>2012-10-18 17:40</td>
                        <td>
							<a href="standard_add.html">修改</a>						   
							<a href="#">删除</a>
						</td>                        
                    </tr>
					
					 <tr id="product1">
                        <td>3</td>
                        <td><input type="checkbox" /></td>
						<td>a1002</td>
                        <td><a href="standard_view.html">项目经理</a></td> 
						<td>审核通过</td> 						
                        <td>2012-10-18 17:40</td>
                        <td>
							
						</td>                        
                    </tr>
					
					
					
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