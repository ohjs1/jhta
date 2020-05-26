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
	Connection con = null;
	PreparedStatement pstmt = null;
	int num =Integer.parseInt(request.getParameter("num"));
	int n =0;
	try {
		con =JDBCUtil.getConn();
		String sql ="delete from board where num=?";
		pstmt =con.prepareStatement(sql);
		pstmt.setInt(1, num);
		
		n =pstmt.executeUpdate();
		
		if(n>0){
			System.out.println("글삭제 완료됨!");
			%>
			<script type="text/javascript">
				alert("글삭제 완료!");
				location.href="list.jsp";
			</script>
			<%
		} else {
			System.out.println("글삭제 실패됨!");
		}
		
	} catch(SQLException se){
		System.out.println(se.getMessage());
	} finally {
		JDBCUtil.close(null, pstmt, con);
	}
%>
</body>
</html>