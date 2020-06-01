<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@page import="org.json.JSONObject"%>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		System.out.println(id);
		System.out.println(pwd);
		
		JSONObject json =new JSONObject();
		json.put("id", id);
		json.put("pwd", pwd);
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.print(json);
	%>
