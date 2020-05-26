<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function validate(){
		var id =document.getElementById("id");
		var pw =document.getElementById("pw");
		
		console.log(id);
		console.log(pw);
		
		
		if(id.value == "" || pw.value == ""){
			alert("아이디 또는 비밀번호를 입력해주세요.");
			id.focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
<%
	String errMsg =(String)session.getAttribute("errMsg");
	if(errMsg == null){
		errMsg ="";
	}
	
	String id =(String)session.getAttribute("id");
	String pw =(String)session.getAttribute("pw");
	String email =(String)session.getAttribute("email");
	
	if(id == null || pw == null || email == null){
		id ="";
		pw ="";
		email ="";
	}
%>
<h1>회원가입</h1>
<form action="joinOk.jsp" onsubmit ="return validate()">
	아이디 <input type="text" name="id" id="id" value="<%=id %>">
	<span id="errMsg"><%=errMsg %></span><br>
	비밀번호 <input type="password" name="pw" id="pw" value="<%=pw %>"><br>
	이메일 <input type="text" name="email" value="<%=email %>"><br>
	<!-- 회원가입 기능을 구현해 보세요.
		기존에 가입된 아이디가 있는 경우는 span#errMsg에 아이디가 존재합니다
		라고 출력되도록 해보세요.
	 -->
	
	
	<input type="submit" value="가입">
	<input type="reset" value="취소">
</form>
<!-- 아이디와 비밀번호가 입력되었는지 확인하기 -->
</body>
</html>