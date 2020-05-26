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
		</div>
		<div id="content">
		<table>
<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	int num =Integer.parseInt(request.getParameter("num"));
	String writer ="";
	String email ="";
	String title ="";
	String content ="";
	
	try {
		con =JDBCUtil.getConn();
		String sql ="select * from board where num=?";
		pstmt =con.prepareStatement(sql);
		
		pstmt.setInt(1, num);
		
		rs =pstmt.executeQuery();
		
		while(rs.next()){
			writer =rs.getString("writer");
			email =rs.getString("email");
			title =rs.getString("title");
			content =rs.getString("content");
			%>
				<tr>
					<th style="width:100px;">글번호</th>
					<th style="width:600px;"><%=num %></th>
				</tr>
				<tr>
					<th>글쓴이</th>
					<th><%=writer %></th>
				</tr>
				<tr>
					<th>이메일</th>
					<th><%=email %></th>
				</tr>
				<tr>
					<th>글제목</th>
					<th><%=title %></th>
				</tr>
				<tr>
					<th>글내용</th>
					<th><%=content %></th>
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
		<div id="footer">
			<a href="update.jsp?num=<%=num %>">수정</a>&nbsp;|&nbsp;<a href="delete.jsp?num=<%=num %>">삭제</a>&nbsp;|&nbsp;<a href="list.jsp">목록</a>
		</div>
	</div>
</body>
</html>