<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="login" class="test.beans.Login" scope="session"/>
<jsp:setProperty property="*" name="login"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>등록된 아이디 정보</h1>
아이디 :<jsp:getProperty property="id" name="login"/><br>
비밀번호 :<jsp:getProperty property="pwd" name="login"/>
</body>
</html>