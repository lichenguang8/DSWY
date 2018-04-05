$(document).ready(function(){
	
	//---------------------------职位发布管理----------------------------------------------
    $("#demo1_add_select").change(function(){
    	//$('#test').attr('value','2');设置值为2的option为选中状态 
    	//$('#test option:selected').val();获取选中的值 
    	//$('#testSelect option:selected').text();//选中的文本
    	//$("#select_id").append("<option value='Value'>Text</option>");为Select追加一个Option(下拉项) 
    	
    	var getValue = $("#demo1_add_select").val();
    	
    	$.ajax({
    		type:'post',
    		/*date:{"deptName":getValue},*/
    		contentType: "application/json",
    		dateType:'json',
    		url: encodeURI(encodeURI('../zhaopin/selectRoleByDeptName.do?deptName='+getValue)),
    		success:function(data){
    			/*var maxIndex=$("#demo1_add_roleName option:last").attr("index"); //获取Select最大的索引值 
    			alert(maxIndex);
    			for(var i=1;i<=maxIndex;i++){
    				$("#demo1_add_roleName option[index='"+i+"']").remove();
    			}*/
    			//alert(data[0].deptBean.deptShortName)
    			$("#demo1_add_deptShortname").val(data[0].deptBean.deptShortName);
    			$("#demo1_add_roleName").empty();
    			$("#demo1_add_roleName").prepend("<option value=''>--请选择--<option>");
    			for(var i=0;i<data.length;i++){
    				$("#demo1_add_roleName").append("<option value='"+data[i].roleName+"'>"+data[i].roleName+"</option>");
    			}
    			$("#demo1_add_roleName option[index='2']").remove();
    		}
    	});
    });
    
    $("#demo1_up_select").change(function(){
    	//$('#test').attr('value','2');设置值为2的option为选中状态 
    	//$('#test option:selected').val();获取选中的值 
    	//$('#testSelect option:selected').text();//选中的文本
    	//$("#select_id").append("<option value='Value'>Text</option>");为Select追加一个Option(下拉项) 
    	
    	var getValue = $("#demo1_up_select").val();
    	
    	$.ajax({
    		type:'post',
    		/*date:{"deptName":getValue},*/
    		contentType: "application/json",
    		dateType:'json',
    		url: encodeURI(encodeURI('../zhaopin/selectRoleByDeptName.do?deptName='+getValue)),
    		success:function(data){
    			/*var maxIndex=$("#demo1_add_roleName option:last").attr("index"); //获取Select最大的索引值 
    			alert(maxIndex);
    			for(var i=1;i<=maxIndex;i++){
    				$("#demo1_add_roleName option[index='"+i+"']").remove();
    			}*/
    			alert(data[0].deptBean.deptShortName)
    			$("#demo1_up_deptShortname").val(data[0].deptBean.deptShortName);
    			$("#demo1_up_roleName").empty();
    			$("#demo1_up_roleName").prepend("<option value=''>--请选择--<option>");
    			for(var i=0;i<data.length;i++){
    				$("#demo1_up_roleName").append("<option value='"+data[i].roleName+"'>"+data[i].roleName+"</option>");
    			}
    			$("#demo1_up_roleName option[index='2']").remove();
    		}
    	});
    });
    
    $("#demo1_add_roleName").change(function(){
    		var getValue = $("#demo1_add_roleName").val();
    		//var checkIndex=$("#demo1_add_select ").get(0).selectedIndex;
    		//alert(checkIndex);
    		$.ajax({
        		type:'post',
        		/*date:{"deptName":getValue},*/
        		contentType: "application/json",
        		dateType:'json',
        		url: encodeURI(encodeURI('../zhaopin/selectRoleByRoleName.do?roleName='+getValue)),
        		success:function(data){
        			alert(data)
        			$("#demo1_add_hidden").val(data.roleId);
        			$("#demo1_add_roleNumber").val(data.roleNumber);
        			$("#demo1_add_roleDescribe").val(data.roleDescribe);
        		}
        	});
    	});
    });
    
    $(function(){
    	$("#demo1_up_roleName").change(function(){
    		var getValue = $("#demo1_up_roleName").val();
    		//var checkIndex=$("#demo1_add_select ").get(0).selectedIndex;
    		//alert(checkIndex);
    		$.ajax({
        		type:'post',
        		/*date:{"deptName":getValue},*/
        		contentType: "application/json",
        		dateType:'json',
        		url: encodeURI(encodeURI('../zhaopin/selectRoleByRoleName.do?roleName='+getValue)),
        		success:function(data){
        			alert(data)
        			$("#demo1_up_hidden").val(data.roleId);
        			$("#demo1_up_roleNumber").val(data.roleNumber);
        			$("#demo1_up_roleDescribe").val(data.roleDescribe);
        		}
        	});
    	});
    });
 
    
    //----------------------------简历管理----------------------------------
    $("#demo2_add_select").change(function(){
    	var getValue = $("#demo2_add_select").val();
    	$.ajax({
    		type:'post',
    		/*date:{"deptName":getValue},*/
    		contentType: "application/json",
    		dateType:'json',
    		url: encodeURI(encodeURI('../zhaopin/selectRoleByDeptName.do?deptName='+getValue)),
    		success:function(data){
    			/*var maxIndex=$("#demo1_add_roleName option:last").attr("index"); //获取Select最大的索引值 
    			alert(maxIndex);
    			for(var i=1;i<=maxIndex;i++){
    				$("#demo1_add_roleName option[index='"+i+"']").remove();
    			}*/
    			//alert(data[0].deptBean.deptShortName)
    			$("#demo1_add_deptShortname").val(data[0].deptBean.deptShortName);
    			$("#demo1_add_roleName").empty();
    			$("#demo1_add_roleName").append("<option>--请选择--<option>");
    			for(var i=0;i<data.length;i++){
    				$("#demo1_add_roleName").append("<option value='"+data[i].roleName+"'>"+data[i].roleName+"</option>");
    			}
    		}
    	});
    });
    
   /* $(function(){
    	$("#demo2_add_roleName").change(function(){
    		var getValue = $("#demo2_add_roleName").val();
    		$.ajax({
        		type:'post',
        		date:{"deptName":getValue},
        		contentType: "application/json",
        		dateType:'json',
        		url: encodeURI(encodeURI('../jianli/selectRoleByRoleName.do?roleName='+getValue)),
   
        		success:function(data){
        			alert(data.deptBean.deptShortName)
        			$("#demo2_add_hidden").val(data.roleId);
        			$("#demo2_add_roleNumber").val(data.roleNumber);
        			$("#demo2_add_deptShortname").val(data.deptBean.deptShortName);
        		}
        	});
    	});*/
    	
    	
    	 $(function(){
    	    	$("#demo2_add_roleName").change(function(){
    	    		var getValue = $("#demo2_add_roleName").val();
    	    		$.ajax({
    	        		type:'post',
    	        		/*date:{"deptName":getValue},*/
    	        		contentType: "application/json",
    	        		dateType:'json',
    	        		url: encodeURI(encodeURI('../zhaopin/selectRoleByZhaopin.do?roleName='+getValue)),
    	   
    	        		success:function(data){
    	        			alert(data.roleBean.deptBean.deptShortName)
    	        			$("#demo2_add_hidden").val(data.roleBean.roleId);
    	        			$("#demo2_add_hidden2").val(data.zhaopinId);
    	        			$("#demo2_add_roleNumber").val(data.roleBean.roleNumber);
    	        			$("#demo2_add_deptShortname").val(data.roleBean.deptBean.deptShortName);
    	        		}
    	        	});
    	    	});
    });
    
