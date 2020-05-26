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
	//로그아웃기능
	session.invalidate(); //세션방 무효화 하기
%>
<h1>로그아웃 되었습니다..</h1>
<a href="mypage.jsp">mypage.jsp</a>
</body>
</html>