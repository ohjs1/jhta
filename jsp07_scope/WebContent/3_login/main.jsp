<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
<%
	String id =(String)session.getAttribute("id");

	if(id == null){
		%>
		<li><a href="login.jsp">회원 로그인</a></li>
		<%
	} else {
%>
	<li><a href="logout.jsp">로그아웃</a></li>
<%
}
%>
<li><a href="items.jsp">상품목록</a></li>
<li><a href="mypage.jsp">마이페이지</a></li>
</ul>
</body>
</html>