<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	System.out.println("id:" + id + ", pwd:" + pwd);
	
	//xml 형태 응답,
	response.setContentType("text/xml; charset=utf-8");
	
	PrintWriter pw = response.getWriter();
	
	pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	pw.print("<div id='result'>");
	pw.print("반환값");
	pw.print("</div>");
%>
