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
	String id =request.getParameter("id");
	String pwd =request.getParameter("pwd");
	
	//아이디 쿠키에 담기
	Cookie cookie1 =new Cookie("id", id); //쿠키생성
	cookie1.setPath("/");
	cookie1.setMaxAge(60*2); //쿠키 유지시간 설정
	response.addCookie(cookie1);
	
	Cookie cookie2 =new Cookie("pwd", pwd); 
	cookie2.setMaxAge(60*2); 
	response.addCookie(cookie2);
%>
<h1>쿠키에 저장완료!</h1>
<a href="main.jsp">메인</a><br>
<a href="getCookie.jsp">쿠키보러가기</a><br>
</body>
</html>