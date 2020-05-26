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
	request.setCharacterEncoding("utf-8"); //한글이 꺠지지 않도록 인코딩 설정하기 (post 방식인 경우)
	String num =request.getParameter("num");
	String name =request.getParameter("name");
	String phone =request.getParameter("phone");
%>

번호 : <%=num %><br>
이름 : <%=name %><br>
전화번호 : <%=phone %><br>
</body>
</html>