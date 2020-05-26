<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="db.ConnectionPool"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id =request.getParameter("id");
	Connection con =null;
	PreparedStatement pstmt =null;
	ResultSet rs =null;
	boolean using =false; //사용중
	try {
		con =ConnectionPool.getCon();
		String sql ="select * from myusers where id=?";
		pstmt =con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs =pstmt.executeQuery();
		
		if(rs.next()){
			using =true;
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
	pw.print("</result>");
%>