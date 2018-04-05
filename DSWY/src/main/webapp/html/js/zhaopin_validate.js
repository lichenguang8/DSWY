
	$.validator.setDefaults({
		submitHandler: function(form) {
			 form.submit(); 
		}
	});
	$().ready(function() {
		$("#demo1_add_form").validate({
			rules: {
				deptName: "required",
				zhaopinType:"required",
				zhaopinNum: {
					required: true,
					digits:true
				},
				roleName:"required",
				endTime: {
					required: true,
				},
				startTime: {
					required: true,
				},
				jobmiaoshu: {
					required: true
				},
				yaoqiu: "required"
			},
			messages: {
				deptName:"请选择一个部门名称",
				zhaopinType:"请选择一个招聘类型",
				zhaopinNum: {
					required: "数字不能为空",
					digits: "请输入一个正整数"
				},
				roleName:"请选择一个职位名称",
				startTime: {
					required: "时间不能为空"
				
				},
				endTime: {
					required: "截止时间不能为空"
				
				},
				jobmiaoshu: "职位描述不能为空",
				yaoqiu: "要求不能为空",
				
			}
		});
	});
