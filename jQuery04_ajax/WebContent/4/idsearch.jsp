<%@page import="db.ConnectionPool"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	boolean using=false;//찾았는지 
	String id=null;
	try{
		con=ConnectionPool.getCon();
		String sql="select RPAD( SUBSTR(id,1,3), LENGTH(id), '*') id " +
				   "from myusers where pwd=? and email=?" ;
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,pwd);
		pstmt.setString(2,email);
		rs=pstmt.executeQuery();
		if(rs.next()){
			using=true;
			id=rs.getString("id");
			System.out.println(id);
		}
	}catch(SQLException se){
		se.printStackTrace();
	}finally{
		try{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}catch(SQLException s){
			s.printStackTrace();
		}
	}
	response.setContentType("text/xml;charset=utf-8");
	PrintWriter pw=response.getWriter();
	pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	pw.print("<data>");
	pw.print("<using>" + using +"</using>");
	pw.print("<id>"+id+"</id>");
	pw.print("</data>");
%>







