<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<%
	String file =request.getParameter("file");
	//System.out.println(file);
	if(file==null){
		file ="list.jsp";
	}
%>
<div id="warp">
	<div id="header">
		<%@include file="menu.jsp" %>
	</div>
	<div id="main">
		<jsp:include page="<%=file %>"/>
	</div>
	<div id="footer"></div>
</div>
</body>
</html>