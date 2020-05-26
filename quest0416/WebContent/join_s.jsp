<%@page import="db.JDBCUtil"%>
<%@page import="java.sql.SQLException"%>
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
	PreparedStatement pstmt =null;
	int n =0;
	
	try {
		con =JDBCUtil.getConn();
		String sql ="insert into myusers values(?, ?, ?, sysdate)";
		pstmt =con.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, email);
		
		n =pstmt.executeUpdate();
		
		if(n>0){
			%>
				<script type="text/javascript">
					alert("회원 가입 성공!");
					location.href="list.jsp";
				</script>
			<%
		} else {
			%>
			<script type="text/javascript">
				alert("회원가입 실패");
				history.back();
			</script>
			<%
		}
		
	} catch(SQLException sq){
		System.out.println(sq.getMessage());
	} finally {
		JDBCUtil.close(null, pstmt, con);
	}
%>
</body>
</html>