<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

        <title>人事管理</title>

        <link href="../../css/mine.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：考试管理-》考试科目管理</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="add.jsp">【申请登记】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="#" method="get">
                   姓名: 
					<input type="text"  />
					 审核状态: 
					<select>
						<option>--请选择--</option>
						<option>起草</option>
						<option>审核中</option>
						<option>审核通过</option>
						<option>驳回</option>
						<option>变更</option>
						<option>变更审核中</option>
					</select>
					档案状态：
					<select>
						<option>--请选择--</option>
						<option>试用期</option>
						<option>正式员工</option>
						<option>离职</option>
						<option>已删除</option>
						<option>实习员工</option>
					</select>
					用户编号：
					<input type="text" />至<input type="text"/>
                    <input value="查询" type="submit" />
					
                </form>
            </span>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                        <td width="30px;"><input type="checkbox" /></td>						
                        <td width="80px;">用户编号</td>
                        <td >姓名</td>
						<td>性别</td>
						<td>身份证号</td>
						<td>教练</td>
						<td>预约日期</td>
						<td>申请日期</td>
						<td>科目状态</td>
						<td>审核状态</td>                      
                        <td align="center" width="100px;">操作</td>
                    </tr>

                    <tr id="product1">
                        <td><input type="checkbox" /></td>
						<td>BDQN000001</td>
						<td>张华</td>
						<td>男</td>
						<td>产品设计中心</td>
						<td>技术培训师</td>
						<td>高级技术顾问</td>
						<td>2013-10-10</td>
						<td>起草</td>
						<td>试用期</td>
						<td>
							<a href="add.html">修改</a>
							<a href="view.html">明细</a>
							<a href="#">删除</a>
						</td>
                    </tr>
					 <tr id="product1">
                        <td><input type="checkbox" /></td>
						<td>BDQN000002</td>
						<td>赵燕</td>
						<td>女</td>
						<td>产品设计中心</td>
						<td>技术培训师</td>
						<td>中级技术顾问</td>
						<td>2013-11-21</td>
						<td>审核通过</td>
						<td>正式员工</td>
						<td>
							<a href="add.html">变更</a>
							<a href="view.html">明细</a>
							<a href="#">删除</a>
						</td>
                    </tr>
					
					 <tr id="product1">
                        <td><input type="checkbox" /></td>
						<td>BDQN000003</td>
						<td>李华</td>
						<td>女</td>
						<td>产品设计中心</td>
						<td>技术培训师</td>
						<td>初级技术顾问</td>
						<td>2013-11-21</td>
						<td>驳回</td>
						<td>试用期</td>
						<td>
							<a href="add.html">复核</a>
							<a href="view.html">明细</a>
						</td>
                    </tr>
					
					 <tr id="product1">
                        <td><input type="checkbox" /></td>
						<td>BDQN000004</td>
						<td>赵静</td>
						<td>女</td>
						<td>平台研发中心</td>
						<td>前台工程师</td>
						<td>初级技术顾问</td>
						<td>2013-11-21</td>
						<td>审核通过</td>
						<td>已删除</td>
						<td>						
							<a href="view.html">明细</a>
							<a href="#">永久删除</a>
							<a href="#">恢复</a>
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