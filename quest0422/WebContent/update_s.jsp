<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//int num, String writer, String email, String title, String content
	int num =Integer.parseInt(request.getParameter("num"));
	String writer =request.getParameter("writer");
	String email =request.getParameter("email");;
	String title =request.getParameter("title");;
	String content =request.getParameter("content");;

	BoardDao dao =new BoardDao();
	int n =dao.update(num, writer, email, title, content);
	
	if(n>0){
		System.out.println("수정 성공!");
		response.sendRedirect("main.jsp");
	} else {
		System.out.println("수정 실패!");
		out.write("<p>수정 실패</p>");
	}
%>