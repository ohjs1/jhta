<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="db.ConnectionPool"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sdate = request.getParameter("sdate");
	System.out.println(sdate); 
	
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		con = ConnectionPool.getCon();
		String sql = "select * from myusers where to_char(mydate) = to_date(?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, sdate);
		
		rs = pstmt.executeQuery();
		
		JSONArray jrr = new JSONArray();
		while(rs.next()){
			JSONObject json = new JSONObject();
			json.put("id", rs.getString("id"));			
			json.put("pw", rs.getString("pw"));			
			json.put("email", rs.getString("email"));			
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