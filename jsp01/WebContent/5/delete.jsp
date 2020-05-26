<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
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
	int num = Integer.parseInt(request.getParameter("num"));
	int n = 0;
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(url, "scott", "tiger");
		String sql ="delete from members where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		n =pstmt.executeUpdate();
	} catch(ClassNotFoundException cn){
		cn.printStackTrace();
	} catch(SQLException sq){
		sq.printStackTrace();
	} finally {
		if(con!=null) con.close();
		if(pstmt!=null) pstmt.close();
	}
		
		if(n>0){
%>
			<script type="text/javascript">
				alert("삭제성공!");
				location.href="list.jsp";
			</script>
<%
		}else{
%>
			<script type="text/javascript">
				alert("삭제실패!");
				history.go(-1); //이전페이지로 이동
			</script>

<%
		}	
%>
<br>
<a href="main.jsp">메인페이지로 이동</a>
</body>
</html>