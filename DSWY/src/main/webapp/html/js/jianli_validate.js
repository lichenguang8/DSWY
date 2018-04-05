

$.validator.setDefaults({
		submitHandler: function(form) {
			 form.submit(); 
		}
	});
jQuery.validator.addMethod("isIdCardNo", function(value, element) {
	return this.optional(element) || idCardNoUtil.checkIdCardNo(value);
	}, "请正确输入您的身份证号码");
jQuery.validator.addMethod("mobile",function(value,element){
	var length = value.length;
	var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
	return this.optional(element)||(length==11&&moblie.test(value));
},"手机号码格式错误");
jQuery.validator.addMethod("selectNone",function(value,element){
	return value=="-请选择-";
},"必须选择一项");
	$().ready(function() {
		$("#demo2_add_form").validate({
			rules: {

				roleName:{
					required:true,
					selectNone:true
				},
				roleNumber: "required",
				deptShortName:"required",
				xingming:"required",
				xingbie:"required",
				zhaopinType:{
					required:true,
					selectNone:true
				},
				email:{
					required:true,
					email:true
				},
				tel:{
					required:true,
					mobile:true
				},
				idcard:{
					required:true,
					isIdCardNo:true,
				},
				newfile:"required",
				dtime:"required",
				tuijianren:"required",
				tuijiantime:"required",
				xizi:{
					required:true,
					digits:true
				}
			},
			messages: {
				roleName:"请选择一个应聘职位",
				roleNumber: {
					required: "部门编号不能为空",
				},
				xingming: {
					required: "姓名不能为空",
				
				},
				xingbie: {
					required: "性别不能为空"
				
				},
				zhaopinType:"请选择一个招聘类型",
				email: {
					email:"请输入正确的邮箱格式",
					required: "邮箱不能为空"
				},
				tel:{
					required: "请输入联系电话",
					mobile:"手机号码格式错误"
				},
				newfile:"请上传简历",
				idcard:{
					required:"身份证号不能为空",
					isIdCardNo:"请输入正确的身份证号"
				},
				xizi:{
					required:"请输入期望薪资",
					digits:"请输入一个正数"
				},
				tuijiantime: "推荐时间不能为空",
				tuijianren: "推荐人不能为空",
				deptShortName:"请选则招聘类型不能为空",
			}
		});
	});
