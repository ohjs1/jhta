<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/common.css">
</head>
<body>
<%
	String path =request.getParameter("file");
	if(path == null){
		path ="main.jsp";
	} 
%>
<div id="wrap">
	<div id="header">
	<div>
		<%@include file="header.jsp" %>
	</div>
	</div>
	</div>
	<div id="main">
	<div>
		<jsp:include page="<%=path %>"/>
	</div>
	</div>
	<div id="footer">
		<%@include file="footer.jsp" %>
	</div>
</div>
</body>
</html>