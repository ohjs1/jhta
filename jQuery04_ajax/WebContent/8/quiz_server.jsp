<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="db.ConnectionPool"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//System.out.println("test");
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int snum = Integer.parseInt(request.getParameter("snum"));
	System.out.println(snum);
	
	try {
		con = ConnectionPool.getCon();
		String sql = "select * from members where num = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, snum);
		rs = pstmt.executeQuery();
		
		JSONArray jrr = new JSONArray();
		
		while(rs.next()){
		JSONObject json = new JSONObject();
			json.put("num", rs.getInt("num"));
			json.put("name", rs.getString("name"));
			json.put("phone", rs.getString("phone"));
			json.put("addr", rs.getString("addr"));
			json.put("regdate", rs.getDate("regdate"));
			
			jrr.put(json);
		}
		
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.print(jrr);
	} catch(SQLException s) {
		System.out.println(s.getMessage());
	} finally {
		ConnectionPool.close(pstmt, rs, con);
	}
%>