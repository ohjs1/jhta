<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id ="test";
	String pwd ="1234";
	String email ="test@daum.net";
	
	JSONObject json =new JSONObject();
	json.put("id", id);
	json.put("pwd", pwd);
	json.put("email", email);
	
	//json으로 응답하기
	response.setContentType("text/plain; hcarset=utf-8"); //plain 단순 문자열이라는 표시
	PrintWriter pw =response.getWriter();
	pw.print(json); //json문자열로 응답
	
%>