<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<%
	String id =(String)session.getAttribute("id");
%>
<div id="warp">
		<div id="menu">
			<h1>방명록</h1>
			<%
				if(id != null){
					%>
						<a href="write.jsp">글쓰기</a>
					<%
				}
			%>
			<a href="list.jsp">메인</a>
		</div>
		<div id="content">
			<form action="login_s.jsp" method="post">
				아이디 : <input type="text" name="id"><br><br>
				비밀번호 : <input type="password" name="pw"><br><br>
				<input type="submit" value="전송">
			</form>
		</div>
	</div>
</body>
</html>