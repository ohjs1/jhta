<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mem" class="test.vo.MembersVo"/>
<jsp:setProperty property="*" name="mem"/>
<jsp:useBean id="dao" class="test.dao.MembersDao"/>

<%
	int m =dao.insert(mem);
	if(m>0){
		%>
			<h1>회원가입 성공!</h1>
		<%
	} else {
		%>
		<h1>회원가입 실패!</h1>
	<%
	}
%>
<a href="main.jsp">메인</a>
</body>
</html>