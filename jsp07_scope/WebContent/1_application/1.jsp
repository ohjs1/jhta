<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1_application/1.jsp</title>
</head>
<body>
<%
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	application.setAttribute("url", url);
	//application 스코프에 객체 넣기
	
	String a =(String)application.getAttribute("url");
	//application 스코프에 저장된 객체 꺼내오기
%>

DB서버 URL: <%=a %>
</body>
</html> 