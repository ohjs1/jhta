<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
<%
	String cp =request.getContextPath();
%>
컨텍스트페스 : <%=cp %><br>
	<li><a href="/login.jsp">로그인1</a></li>
	<li><a href="<%=cp %>/1/login.jsp">로그인2</a></li>
	<li><a href="servlet01">servlet01(상대)</a></li>
	<li><a href="/jsp14_path/servlet01">servlet01(절대)</a></li>
	
	
	<li><a href="member/login">Gologin(상대)</a></li>
	<li><a href="/jsp14_path/member/login">Gologin(절대)</a></li>
</ul>
</body>
</html>