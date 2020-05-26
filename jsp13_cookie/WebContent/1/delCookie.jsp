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
	//쿠키 삭제하기 ->동일한 이름의 쿠키생성후 유지시간을 0으로 설정
	Cookie cookie =new Cookie("id", "");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
%>
</body>
<h1>쿠키삭제완료!</h1>>
<li><a href="main.jsp">메인</a></li><br>
	<li><a href="getCookie.jsp">쿠키보러가기</a></li>
</html>