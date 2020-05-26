<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>result.jsp</h1>
<%
	String msg =(String)request.getAttribute("msg");
%>
msg : <%=msg %><br>
<a href="">메인페이지(상대)</a>
<a href="<%=request.getContextPath()%>/main.jsp">메인페이지(절대)</a>
<a href="member/login">GoLogin(상대)</a>
<a href="<%=request.getContextPath() %>/member/login">GoLogin(절대)</a>
</body>
</html>