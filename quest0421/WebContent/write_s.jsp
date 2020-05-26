<%@page import="db.JDBCUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection con =null;
	PreparedStatement pstmt =null;
	
	String writer =request.getParameter("writer");
	String email =request.getParameter("email");
	String title =request.getParameter("title");
	String content =request.getParameter("content");
	
	try {
		con =JDBCUtil.getConn();
		String sql ="insert into board values(board_seq.nextval, ?, ?, ?, ?, sysdate)";
		pstmt =con.prepareStatement(sql);
		
		pstmt.setString(1, writer);
		pstmt.setString(2, email);
		pstmt.setString(3, title);
		pstmt.setString(4, content);
		int n =pstmt.executeUpdate();
		
		if(n>0){
			System.out.println("글작성 성공!");
		} else {
			System.out.println("글작성 실패!");
		}
		
	} catch(SQLException sq){
		System.out.println(sq.getMessage());
	} finally {
		JDBCUtil.close(null, pstmt, con);
	}
%>