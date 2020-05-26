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
			<a href="list.jsp">메인</a>
		</div>
		<div id="content">
<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	int num =Integer.parseInt(request.getParameter("num"));
	
	try {
		con =JDBCUtil.getConn();
		String sql ="select * from board where num=?";
		pstmt =con.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs =pstmt.executeQuery();
		
		rs.next();
		String writer =rs.getString("writer");
		String email =rs.getString("email");
		String title =rs.getString("title");
		String content =rs.getString("content");
		
		%>
		<form action="update_s.jsp" method="post">
		<input type="hidden" name="num" value="<%=num %>">
			작성자 : <input type="text" name="writer" value="<%=writer %>"><br><br>
			이메일 : <input type="text" name="email" value="<%=email %>"><br><br>
			글제목 : <input type="text" name="title" value="<%=title %>"><br><br>
			글내용 : <textarea rows="10" cols="60" name="content"><%=content %></textarea><br><br>
			<input type="submit" value="전송">
		</form>
		<%
		
		
	} catch(SQLException se){
		System.out.println(se.getMessage());
	} finally {
		JDBCUtil.close(rs, pstmt, con);
	}
%>
		</div>
	</div>
</body>
</html>