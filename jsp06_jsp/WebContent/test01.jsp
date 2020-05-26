<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>test01.jsp</h1>
<% //스크립트릿
	String name ="홍길동";
	out.write("name:" + name + "<br>");
%>
<%-- 
<%
	String name ="김길동";
%>
--%>
<!-- sum 두수합 구해서 출력해보세요. -->
<form action="sum.jsp" method="post">
	수1<input type="text" name="num1"><br>
	수2<input type="text" name="num2"><br>
	
	<input type="submit" value="전송">
</form>
</body>
</html>