<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

        <title>招聘信息</title>

        <link href="../../css/mine.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：招聘管理-》招聘发布管理</span>
                 <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="add.html">【添加】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="#" method="get">
				 公告名称: 
					<input type="text"  />
                    公告分类: 
					<select name="s_product_mark" style="width: 100px;">

                        <option selected="selected" >-请选择-</option>
						<option value="0">管理</option>
                        <option value="1">技术</option>
						<option value="2">实施</option>
                    </select>
                   
					 公布日期: 
					<input type="text"  />
                    截止日期:<input type="text"  />
					
					<input value="查询" type="submit" />
					
                </form>
            </span>
			
        </div>
		 <!--  <div style="font-size: 13px; margin: 10px 5px;">
		  <p><a href="add.html"><button style="background-color:#E8F2FC">职位发布登记 </button></a></p>
		  </div> -->
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                        <td width="40px;">公告编码</td>
                        <td width="40px;">公告名称</td>						
                        <td width="40px;">公布日期</td>
                        <td width="40px;">截止日期</td>
						<td width="40px;">电话</td>
                        <td width="40px;">费用</td>
						<td width="40px;">负责人</td>						
                        <td align="center" width="70px;">操作</td>
                    </tr>

                    <tr id="product1">
                        <td>BDQN-BM03</td>
                        <td><a href="view.html">技术培训师</a></td>
						<td>技术</td>
                        <td>产品设计中心</td> 
						<td>5</td> 						
                        <td>2013-10-18</td>
						<td>2013-10-23</td>
                        <td><a href="#">变更</a> &nbsp;&nbsp;<a href="#">删除</a> </td>                        
                    </tr> 
					 <tr id="product1">
                        <td>BDQN-BM03</td>
                        <td><a href="view.html">技术培训师</a></td>
						<td>技术</td>
                        <td>产品设计中心</td> 
						<td>5</td> 						
                        <td>2013-10-18</td>
						<td>2013-10-23</td>
                        <td><a href="add.html">变更</a> &nbsp;&nbsp;<a href="#">删除</a> </td>                        
                    </tr> 
					
                    <tr>
                        <td colspan="8" style="text-align: center;">						
						<a style="text-decoration: none;" href="#">
                            首页 上一页  ... 7 8 9 10 11 12 ... 下一页 尾页 共1234条 每页显示 10/23 </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>