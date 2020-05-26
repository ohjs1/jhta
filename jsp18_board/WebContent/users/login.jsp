<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2_session/login.jsp</title>
</head>
<body>
	<h1>회원로그인</h1>
	<form action="${ cp }/users/login.do" method="post">
		아이디 <input type="text" name="id"><br>
		 비밀번호 <input type="password" name="pwd"><br> 
		 <div>${ requestScope.err }</div>
		 <input type="submit" value="로그인">
	</form>
	<br>
	
</body>
</html>