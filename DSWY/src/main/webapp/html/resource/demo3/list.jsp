<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

        <title>角色管理</title>

        <link href="../../css/mine.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：系统管理-》角色管理</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="add.html">【添加】</a>
					<a style="text-decoration: none;" href="#">【删除】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="#" method="get">
                   角色名称: 
					<input type="text"  />
					 角色编号: 
					<input type="text"  />
					是否启用: 
					<select>
						<option >---请选择---</option>
						<option >是</option>
						<option >否</option>
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
                        <td width="80px;"> 角色编号</td>
                        <td >角色名称</td>
						<td width="100px;">角色分类</td>                       
						<td width="120px;">状态</td>  
                        <td align="center" width="100px;">操作</td>
                    </tr>

                    <tr id="product1">
                        <td>1</td>
                        <td><input type="checkbox" /></td>
						
                        <td><a href="view.html">人事总监</a></td> 
						<td>管理</td> 						
                        <td>人事部</td>
						<td>是</td>
                        <td>
							<a href="add.html">修改</a>						   
							<a href="#">删除</a>
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