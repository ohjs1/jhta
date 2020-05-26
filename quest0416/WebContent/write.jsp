<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/main.css">
<style type="text/css">
	form {
		text-align: center;
		margin: 10px;
	}
</style>
</head>
<body>
<%
	String id =(String)session.getAttribute("id");
%>
	<div id="warp">
		<div id="menu">
			<h1>방면록</h1>
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
			<form action="write_s.jsp" method="post">
				작성자 : <input type="text" name="writer"><br><br>
				이메일 : <input type="text" name="email"><br><br>
				글제목 : <input type="text" name="title"><br><br>
				글내용 : <textarea rows="10" cols="60" name="content"></textarea><br><br>
				<input type="submit" value="전송">
			</form>
		</div>
	</div>
</body>
</html>