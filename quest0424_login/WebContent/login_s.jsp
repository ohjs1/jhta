<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String chk =request.getParameter("chk");
	String id =request.getParameter("id");
	String pwd =request.getParameter("pwd");
	
	if(chk==null) chk="";
	if(chk.equals("on")){
		System.out.println("체크박스 체크됨");
		Cookie cookId =new Cookie("id", id);
		Cookie cookPwd =new Cookie("pwd", pwd);
		
		cookId.setMaxAge(60*60*24*30); //유효기간 30일
		cookPwd.setMaxAge(60*60*24*30);
		
		response.addCookie(cookId); //쿠키 등록
		response.addCookie(cookPwd);
		
		response.sendRedirect("login.jsp");
	} else {
		Cookie cookId =new Cookie("id", id);
		Cookie cookPwd =new Cookie("pwd", pwd);
		
		cookId.setMaxAge(0); //쿠키 소멸
		cookPwd.setMaxAge(0);
		
		response.addCookie(cookId); //쿠키 등록
		response.addCookie(cookPwd);
		
		response.sendRedirect("login.jsp");
	}
%>