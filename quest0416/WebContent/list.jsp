<%@page import="java.sql.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db.JDBCUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<%
	String id =(String)session.getAttribute("id");
%>
	<div id="warp">
		<div id="menu">
			<h1>방명록</h1>
			<%
				if(id != null){
					%>
						<a href="write.jsp">글쓰기</a>
					<%
				}
			%>
			<a href="join.jsp">회원가입</a>
			
			<%
				if(id == null){
					%>
					<a href="login.jsp">로그인</a>
					<%
				} else {
					%>
					<a href="logout.jsp">로그아웃</a>
					<%
				}
			%>
		</div>
		<div id="content">
	<table>
	<tr>
		<th style="width:110px;">글번호</th>
		<th style="width:110px;">작성자</th>
		<th style="width:130px;">이메일</th>
		<th style="width:300px;">글제목</th>
		<th style="width:100px;">날짜</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	
	try {
		con =JDBCUtil.getConn();
		String sql ="select * from board";
		pstmt =con.prepareStatement(sql);
		rs =pstmt.executeQuery();
		
		int num =0;
		String writer ="";
		String email ="";
		String title ="";
		Date w_date =null;
		
		while(rs.next()){
			num =rs.getInt("num");
			writer =rs.getString("writer");
			email =rs.getString("email");
			title =rs.getString("title");
			w_date =rs.getDate("w_date");
	%>
		<tr>
			<td><%=num %></td>
			<td><%=writer %></td>
			<td><%=email %></td>
			<td><a href="contents.jsp?num=<%=num %>"><%=title %></a></td>
			<td><%=w_date %></td>
		</tr>
	<%
		}
		
	} catch(SQLException se){
		System.out.println(se.getMessage());
	} finally {
		JDBCUtil.close(rs, pstmt, con);
	}
%>
	</table>
	</div>
	</div>
</body>
</html>