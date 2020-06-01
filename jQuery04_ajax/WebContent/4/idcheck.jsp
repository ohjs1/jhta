<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="db.ConnectionPool"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pw2 =request.getParameter("pwd");
	String email = request.getParameter("email");
	String id = "";
	
	System.out.println(pw2);
	System.out.println(email);

	Connection con =null;
	PreparedStatement pstmt =null;
	ResultSet rs =null;
	boolean using =false; //사용중
	try {
		con =ConnectionPool.getCon();
		String sql ="select id from myusers where pw=? and email=?";
		pstmt =con.prepareStatement(sql);
		pstmt.setString(1, pw2);
		pstmt.setString(2, email);
		rs =pstmt.executeQuery();
		
		if(rs.next()){
			using =true;
			id = rs.getString("id");
		}
		
	} catch(SQLException se) {
		System.out.println("se.getMessage()");
	} finally {
		ConnectionPool.close(pstmt, rs, con);
	}
	
	//xml로 결과 응답하기
	response.setContentType("text/xml; charset=utf-8");
	PrintWriter pw =response.getWriter();
	pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	pw.print("<result>");
	pw.print("<using>" + using + "</using>");
	pw.print("<id>" + id + "</id>");
	
	pw.print("</result>");
%>