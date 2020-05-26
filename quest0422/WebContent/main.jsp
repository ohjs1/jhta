<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<% 
	String path =request.getParameter("file");
	if(path==null){
		path ="list.jsp";
	}
%>
<div id="wrap">
	<div id="header"><%@include file="menu.jsp" %></div>
	<div id="content">
		<jsp:include page="<%=path %>"/>
	</div>
</div>
</body> 
</html>