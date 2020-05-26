<%@page import="db.JDBCUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id =request.getParameter("id");
	String pw =request.getParameter("pw");
	
	Connection con =null;
	PreparedStatement pstmt =null;
	ResultSet rs =null;
	
	try {
		con =JDBCUtil.getConn();
		String sql ="select * from myusers where id=? and pw=?";
		pstmt =con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		rs =pstmt.executeQuery();
		
		if(rs.next()){
			System.out.println("로그인 성공!");
			session.setAttribute("login", "성공");
			pageContext.forward("main.jsp?file=list.jsp");
		} else {
			System.out.println("로그인 실패!");
		}
		
	} catch(SQLException sq){
		System.out.println(sq.getMessage());
	} finally {
		JDBCUtil.close(rs, pstmt, con);
	}
%>