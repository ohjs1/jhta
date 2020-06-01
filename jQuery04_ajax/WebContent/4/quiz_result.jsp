<%@page import="java.io.PrintWriter"%>
<%@page import="db.ConnectionPool"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	//System.out.println(email);
	//System.out.println(pwd);
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		con = ConnectionPool.getCon();
		String sql = "select id from myusers where pw=? and email=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pwd);
		pstmt.setString(2, email);
		
		rs = pstmt.executeQuery();
		response.setContentType("text/xml; charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.print("<?xml version='1.0' encoding='UTF-8'?>");
		
		if(rs.next()){
			//<?xml version="1.0" encoding="UTF-8"?>
			pw.print("<result>");
			pw.print(rs.getString("id"));
			pw.print("</result>");
		} else {
			pw.print("<result>");
			pw.print("#");
			pw.print("</result>");		
		}
		
	} catch(SQLException s) {
		System.out.println(s.getMessage());
	} finally {
		ConnectionPool.close(pstmt, rs, con);
	}
%>