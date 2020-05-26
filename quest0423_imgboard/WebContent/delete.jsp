<%@page import="test.dao.FileinfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num =Integer.parseInt(request.getParameter("num"));
	FileinfoDao dao =new FileinfoDao();
	int n =dao.delete(num);
	
	if(n>0){
		System.out.println("삭제 성공");
		response.sendRedirect("list.jsp");
	} else {
		System.out.println("삭제 실패");
		out.write("게시글 삭제 실패");
	}
%>