$.validator.addMethod("mobile",function(value,element){
	var length = value.length;
	var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
	return this.optional(element)||(length==11&&moblie.test(value));
},"手机号码格式错误");
$.validator.addMethod("selectNone",function(value,element){
	return value=="-请选择-";
},"必须选择一项");