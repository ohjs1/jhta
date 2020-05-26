<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.JSONObject"%>
<%@page import="db.ConnectionPool"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id =request.getParameter("id");
	Connection con =null;
	PreparedStatement pstmt =null;
	ResultSet rs =null;
	
	try {
		con =ConnectionPool.getCon();
		String sql ="select * from myusers where id=?";
		pstmt =con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs =pstmt.executeQuery();
		
		JSONObject json =new JSONObject();
		
		if(rs.next()){
			//System.out.println("아이디중복됨");
			json.put("msg", "success");
			
		} else {
			//System.out.println("아이디 사용가능");
			json.put("msg", "fail");
		}
		//json으로 응답하기
		response.setContentType("text/plain; hcarset=utf-8"); //plain 단순 문자열이라는 표시
		
		PrintWriter pw =response.getWriter();
		pw.print(json); //json문자열로 응답
	} catch(SQLException s) {
		System.out.println(s.getMessage());
	} finally {
		ConnectionPool.close(pstmt, rs, con);
	}
%>