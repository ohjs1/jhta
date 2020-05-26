<%@page import="java.sql.ResultSet"%>
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
	//1. 사용자정보(id,password) 읽어오기
	Connection con =null;
	PreparedStatement pstmt =null;
	ResultSet rs =null;
	String id =request.getParameter("id");
	String pw =request.getParameter("pwd");
	try {
		con =JDBCUtil.getConn();
		String sql ="select * from myusers where id=? and pw=?";
		pstmt =con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		rs =pstmt.executeQuery();
		
		if(rs.next()){
			//2. 해당정보가 db에 존재하느지 검사하기
			//3. 해당정보가 존재하면 로그인처리(세션아이디 저장하기)
			session.setAttribute("id", id);
			response.sendRedirect("main.jsp");
			//session.setAttribute("pw", pw);
		} else {
			%>
				<script type="text/javascript">
					alert("아이디 또는 비밀번호가 맞지않아요!");
					history.go(-1);
				</script>
			<%
			out.print("해당아이디는 존재하지 않습니다.");
		}
	} catch(SQLException sq){
		System.out.println(sq.getMessage());
	} finally {
		JDBCUtil.close(rs, pstmt, con);
	}
%>
</body>
</html>