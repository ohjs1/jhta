<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	label {
		display: inline-block;
		width: 120px;
	}
</style>
</head>
<body>
<%
	String id ="";
	String pwd ="";
	
	Cookie[] cooks =request.getCookies();
	if(cooks!=null){
		for(Cookie cok : cooks){
			if(cok.getName().equals("id")){
				id =cok.getValue();
			}
			if(cok.getName().equals("pwd")){
				pwd =cok.getValue();
			}
		}
	}
%>
<form action="login_s.jsp" method="post">
	<label for="id">아이디</label><input type="text" id="id" name="id" value="<%=id %>"><br>
	<label for="pwd">비밀번호</label><input type="password" id="pwd" name="pwd" value="<%=pwd %>"><br>
	<input type="checkbox" name="chk" value="on">자동로그인<br>
	<input type="submit" value="로그인">&nbsp;<input type="reset" value="취소">
</form>

</body>
</html>