<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.DriverManager"%>
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
	//1.사용자가 보내온 정보 읽어오기
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	
	//2.사용자정보를 db에 저장하기
	Connection con = null;
	PreparedStatement pstmt = null;
	int n = 0;
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(url, "scott", "tiger");
		
		String sql = "insert into members values(?, ?, ?, ?, sysdate)";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, num);
		pstmt.setString(2, name);
		pstmt.setString(3, phone);
		pstmt.setString(4, addr);
		n = pstmt.executeUpdate();
		
		
	} catch(ClassNotFoundException ce){
		System.out.println(ce.getMessage());
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
	
	
	//3.결과 출력하기
	if(n>0){
		out.print("<h1>회원가입 성공!</h1>");
	} else {
		out.print("<h1>오류로 인한 회원가입 실패!</h1>");
	}
%>

<a href="main.jsp">메인 페이지로 이동</a>
</body>
</html>