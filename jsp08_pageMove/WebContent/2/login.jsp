<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2_session/login.jsp</title>
</head>
<body>
<%
	String errMsg =(String)request.getAttribute("errMsg");
	String id =(String)request.getAttribute("id");
	String pwd =(String)request.getAttribute("pwd");
	if(errMsg == null){
		errMsg ="";
	}
	
	if(id == null || pwd == null){
		id ="";
		pwd ="";
	}
%>
<h1>회원로그인</h1>
<form action="loginOk.jsp" method="post">
	아이디 <input type="text" name="id" value="<%=id %>"><br>
	비밀번호 <input type="password" name="pwd" value="<%=pwd %>"><br>
	<div id="errMsg"><%=errMsg %></div>
	<input type="submit" value="로그인">
</form>
</body>
</html>