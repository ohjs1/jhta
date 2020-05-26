<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2_session/login.jsp</title>
</head>
<body>
<a href="../main.jsp">메인 페이지(상대경로)</a>
<a href="/jsp14_path/main.jsp">메인 페이지(절대경로)</a>


<h1>회원로그인</h1>
<form action="<%=request.getContextPath() %>/member/loginOk" method="post">
	아이디 <input type="text" name="id"><br>
	비밀번호 <input type="password" name="pwd"><br>
	<input type="submit" value="로그인">
</form>
</body>
</html>