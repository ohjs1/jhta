<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>result.jsp 페이지....</h1>
<%
	String id =(String)request.getAttribute("id");
	String pwd =(String)request.getAttribute("pwd");
	//리퀘스트 스코프에 담긴 값 꺼내오기
%>
<p>id : <%=id %></p>
<p>pwd : <%=pwd %></p>
</body>
</html>