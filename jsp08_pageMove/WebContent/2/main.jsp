<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id =(String)session.getAttribute("id");
	String href ="";
	String value ="";
	
	if(id == null){
		href ="login.jsp";
		value ="로그인";
	} else {
		href ="logout.jsp";
		value ="로그아웃";
	}
%>
<h1>main 페이지...</h1>
<ul>
	<li><a href="<%=href %>"><%=value %></a></li>
</ul>
</body>
</html>