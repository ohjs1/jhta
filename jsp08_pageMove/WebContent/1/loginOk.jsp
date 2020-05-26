<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>loginOk.jsp 페이지...</h1>
<%
	String id =request.getParameter("id");
	String pwd =request.getParameter("pwd");
	
	request.setAttribute("id", id);
	request.setAttribute("pwd", pwd);
	//request스코프에 값 담기
	
	//response.sendRedirect("result.jsp");
	//리다이렉트 방식으로 페이지 이동하기
	
	RequestDispatcher rd =request.getRequestDispatcher("result.jsp");
	rd.forward(request, response);
	//포워드 방식으로 페이지 이동하기
%>
</body>
</html>