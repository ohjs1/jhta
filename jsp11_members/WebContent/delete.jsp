<%@page import="test.dao.MembersDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num =Integer.parseInt(request.getParameter("num"));
	MembersDao dao =new MembersDao();
	int n =dao.delete(num);
	
	if(n > 0){
		response.sendRedirect("list.jsp");
	} else {
		out.write("삭제 실패!");
	}
%>
</body>
</html>