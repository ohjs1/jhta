<%@page import="java.sql.SQLException"%>
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
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	String writer =request.getParameter("writer");
	String email =request.getParameter("email");
	String title =request.getParameter("title");
	String content =request.getParameter("content");
	int num =Integer.parseInt(request.getParameter("num"));
	int n =0;
	
	try {
		con = JDBCUtil.getConn();
		String sql = "update board set writer=?, email=?, title=?, content=? where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, writer);
		pstmt.setString(2, email);
		pstmt.setString(3, title);
		pstmt.setString(4, content);
		pstmt.setInt(5, num);
		n =pstmt.executeUpdate();
		
		if(n>0){
			System.out.println(n+"개의 업데이트 완료됨");
			%>
			<script type="text/javascript">
				alert("글수정 완료!");
				location.href="list.jsp";
			</script>
			<%
		} else {
			System.out.println("업데이트 실패!");
		}
		
	} catch(SQLException se){
		System.out.println(se.getMessage());
	} finally {
		JDBCUtil.close(null, pstmt, con);
	}
%>
</body>
</html>