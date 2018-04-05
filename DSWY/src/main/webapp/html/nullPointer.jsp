<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path +"/html/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>空指针异常</h1>
<h1 style="color: red">空指针异常</h1>
<h1 style="color: yellow;">空指针异常</h1>
<h1 style="color: blue;">空指针异常</h1>
<h1 style="color: green;">空指针异常</h1>
<h1 style="color: gray;">空指针异常</h1>
<h1 style="color: orange;">空指针异常</h1>
<h1 style="color: purple;">空指针异常</h1>
<h1 style="color: navy;">空指针异常</h1>
</body>
</html>