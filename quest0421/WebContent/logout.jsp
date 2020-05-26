<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	pageContext.forward("main.jsp?file=list.jsp");
	System.out.println("logout");
%>