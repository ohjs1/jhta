<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.FileNotFoundException"%>
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
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int num = Integer.parseInt(request.getParameter("num"));
	int n = 0;
	int num2 =0;
	String name ="";
	String phone ="";
	String addr ="";
	Date regdate =null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(url, "scott", "tiger");
		
		String sql = "select * from members where num = ?";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, num);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			num2 = rs.getInt("num");
			name = rs.getString("name");
			phone = rs.getString("phone");
			addr = rs.getString("addr");
			regdate = rs.getDate("regdate");
		}
		
	} catch(ClassNotFoundException fn){
		fn.printStackTrace();
	} catch(SQLException sq){
		sq.printStackTrace();
	} finally {
		if(con!=null) con.close();
		if(pstmt!=null) pstmt.close();
		if(rs!=null) rs.close();
	}
	%>

	<form action="update_success.jsp" method="post">
		<input type="hidden" name="num" value=<%=num %>>
		번호 : <input type="text" name="num" value=<%=num %> disabled="disabled"><br>
		이름 : <input type="text" name="name" value=<%=name %>><br>
		폰번호 : <input type="text" name="phone" value=<%=phone %>><br>
		주소 : <input type="text" name="addr" value=<%=addr %>><br>
		가입날짜 : <input type="text" name="regdate" value=<%=regdate %> readonly="readonly"><br>
		<input type="submit" value="완료">
	</form>
	<%
%>
</body>
</html>