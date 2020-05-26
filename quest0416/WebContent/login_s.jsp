<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.JDBCUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
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
			session.setAttribute("id", id);
			%>
				<script type="text/javascript">
					alert("로그인 성공!");
					location.href ="list.jsp";
				</script>
			<%
		} else {
			%>
			<script type="text/javascript">
				alert("로그인 실패!");
				history.back();
			</script>
		<%
		}
				
	} catch(SQLException sq){
		System.out.println(sq.getMessage());
	} finally {
		JDBCUtil.close(rs, pstmt, con);
	}
%>
</body>
</html>