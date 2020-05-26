<%@page import="test.vo.FileinfoVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.dao.FileinfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 보드</title>
</head>
<body>
<div id="imgboard" style="width: 1000px; margin:auto;">
<h1>이미지 게시판</h1>
<h2><a href="boardmain.jsp">처음으로</a></h2>
<br>
<%
	FileinfoDao dao =new FileinfoDao();
	ArrayList<FileinfoVo> list =dao.getList();
	int cnt =0;
	for(FileinfoVo vo : list){
		out.write("<a href='view.jsp?num=" + vo.getFilenum() + "&file=" + vo.getSavafilename() + "'>");
		out.write("<img src='upload/" + vo.getSavafilename() + "'style='width:300px; height:300px; border: 1px solid black;'>");
		out.write("</a>");
		cnt++;
		if(cnt%3==0){
			out.write("<br>");
		}
	}
%>
</div>
</body>
</html>