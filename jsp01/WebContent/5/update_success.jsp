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
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
			
	
	try {
		con =JDBCUtil.getConn();
		String sql = "update members set name=?, phone=?, addr=? where num=?";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		pstmt.setString(3, addr);
		pstmt.setInt(4, num);
	
		pstmt.executeUpdate();
		
		System.out.println("수정 완료!");
		%>
			<script type="text/javascript">
				location.href="list.jsp";
			</script>
		<%
	} catch(SQLException se){
		System.out.println(se.getMessage());
	} finally {
		try{
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch(SQLException se){
			System.out.println(se.getMessage());
		}
	}
%>
</body>
</html>