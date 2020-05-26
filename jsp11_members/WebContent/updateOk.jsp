<%@page import="test.dao.MembersDao"%>
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
	request.setCharacterEncoding("utf-8");
	int num =Integer.parseInt(request.getParameter("num"));
	String name =request.getParameter("name");
	String phone =request.getParameter("phone");
	String addr =request.getParameter("addr");
	
	MembersDao dao =new MembersDao();
	int n =dao.update(num, name, phone, addr);
	
	if(n>0){
		System.out.println("업데이트 완료!");
		response.sendRedirect("list.jsp");
	} else {
		System.out.println("업데이트 실패!");
		out.write("업데이트 실패함");
	}
%>
</body>
</html>