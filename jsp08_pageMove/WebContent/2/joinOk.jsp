<%@page import="db.JDBCUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id =request.getParameter("id");
	String pw =request.getParameter("pw");
	String email =request.getParameter("email");
	
	Connection con =null;
	PreparedStatement pstmt1 =null;
	PreparedStatement pstmt2 =null;
	ResultSet rs =null;
	
	try {
		con =JDBCUtil.getConn();
		String select ="select * from myusers where id =?";
		pstmt1 =con.prepareStatement(select);
		pstmt1.setString(1, id);
		rs =pstmt1.executeQuery();
		
		if(rs.next()){
			session.setAttribute("errMsg", "존재하는 아이디 입니다.");
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			session.setAttribute("email", email);
			pageContext.forward("join.jsp");
		} else {
			//insert
			String insert ="insert into myusers values(?, ?, ?, sysdate)";
			pstmt2 =con.prepareStatement(insert);
			
			pstmt2.setString(1, id);
			pstmt2.setString(2, pw);
			pstmt2.setString(3, email);
			
			pstmt2.executeUpdate();
			System.out.println("회원가입 완료!");
			response.sendRedirect("main.jsp");
		}
		
	} catch(SQLException s){
		System.out.println(s.getMessage());
	} finally {
		JDBCUtil.close(rs, pstmt1, null);
		JDBCUtil.close(pstmt2);
		JDBCUtil.close(con);
	}
	
%>
<h1>joinOk.jsp...</h1>
</body>
</html>