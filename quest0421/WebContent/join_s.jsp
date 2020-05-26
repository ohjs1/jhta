<%@page import="db.JDBCUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id =request.getParameter("id");
	String pw =request.getParameter("pw");
	String email =request.getParameter("email");
	
	Connection con =null;
	PreparedStatement pstmt =null;
	
	try {
		con =JDBCUtil.getConn();
		String sql ="insert into myusers values(?, ?, ?, sysdate)";
		pstmt =con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, email);
		
		int n =pstmt.executeUpdate();
		
		if(n>0){
			System.out.println("회원가입 성공!");
			response.sendRedirect("main.jsp?file=list.jsp");
		} else {
			System.out.println("회원가입 실패!");
		}
		
	} catch(SQLException sq){
		sq.printStackTrace();
	} finally {
		JDBCUtil.close(null, pstmt, con);
	}
%>