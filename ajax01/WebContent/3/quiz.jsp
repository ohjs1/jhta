<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String opr =request.getParameter("opr");
	int num1 =Integer.parseInt(request.getParameter("num1"));
	int num2 =Integer.parseInt(request.getParameter("num2"));
	int result =0;
	System.out.println(opr + " : " + num1 + " : " + num2);
	
	if(opr.equals("1")){
		result =num1 + num2;
	} else if(opr.equals("2")){
		result =num1 - num2;
	} else if(opr.equals("3")){
		result =num1 * num2;
	} else if(opr.equals("4")){
		result =num1 / num2;
	}
	
	response.setContentType("text/xml; charset=utf-8");
	PrintWriter pw =response.getWriter();
	pw.print("<?xml version='1.0' encoding='utf-8'?>");
	pw.print("<result>");
	pw.print("결과값 : " + result);
	pw.print("</result>");
%>