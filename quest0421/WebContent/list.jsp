<%@page import="java.sql.Date"%>
<%@page import="db.JDBCUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table>
	<tr>
		<th style="width:110px;">글번호</th>
		<th style="width:110px;">작성자</th>
		<th style="width:130px;">이메일</th>
		<th style="width:300px;">글제목</th>
		<th style="width:100px;">날짜</th>
	</tr>
<%
	Connection con =null;
	PreparedStatement pstmt =null;
	ResultSet rs =null;
	
	try {
		con =JDBCUtil.getConn();
		String sql ="select * from board order by num desc";
		pstmt =con.prepareStatement(sql);
		rs =pstmt.executeQuery();
		
		while(rs.next()){
			String num =rs.getString("num");
			String writer =rs.getString("writer");
			String email =rs.getString("email");
			String title =rs.getString("title");
			Date w_date =rs.getDate("w_date");
			%>
			<tr>
				<th><%=num %></th>
				<th><%=writer %></th>
				<th><%=email %></th>
				<th><%=title %></th>
				<th><%=w_date %></th>
			</tr>
			<%
		}
		
	} catch(SQLException sql){
		System.out.println(sql.getMessage());
	} finally {
		JDBCUtil.close(rs, pstmt, con);
	}
%>
</table>