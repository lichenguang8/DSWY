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
	 <meta http-equiv=content-type content="text/html; charset=utf-8" />
        <meta http-equiv=pragma content=no-cache />
        <meta http-equiv=cache-control content=no-cache />
        <meta http-equiv=expires content=-1000 />       
        <title>main.jsp</title>
    </head>
		<frameset border=0 framespacing=0 rows="60, *" frameborder=0>
        	<frame name=head src="head.jsp" frameborder=0 noresize scrolling=no>
	            <frameset cols="170, *">
	                <frame name=left src="left.jsp" frameborder=0 noresize />
	                <frame name=right src="right.jsp" frameborder=0 noresize scrolling=yes />
	            </frameset>
    	</frameset>		
    <noframes>	
    </noframes>
</html>