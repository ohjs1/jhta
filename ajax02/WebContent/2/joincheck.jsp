<%@page import="java.io.PrintWriter"%>
<%@page import="db.ConnectionPool"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection con =null;
	PreparedStatement pstmt =null;
	ResultSet rs =null;
	
	String pwd =request.getParameter("pwd");
	String email =request.getParameter("email");
	String id ="";
	
	System.out.println(pwd + ":pwd");
	System.out.println(email + ":email");
	
	try {
		con =ConnectionPool.getCon();
		String sql ="select id from myusers where pw = ? and email = ?";
		pstmt =con.prepareStatement(sql);
		pstmt.setString(1, pwd);
		pstmt.setString(2, email);
		
		rs =pstmt.executeQuery();
		
		if(rs.next()){
			id =rs.getString("id");
		} else {
			id ="아이디를 찾을수 없습니다.";
		}
		
		//xml로 결과 응답하기
		response.setContentType("text/xml; charset=utf-8");
		PrintWriter pw =response.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.print("<result>");
		pw.print("찾은 아이디 :" + id);
		pw.print("</result>");
		
	} catch(SQLException s) {
		System.out.println(s.getMessage());
	} finally {
		ConnectionPool.close(pstmt, rs, con);
	}
%>