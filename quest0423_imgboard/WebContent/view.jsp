<%@page import="test.dao.FileinfoDao"%>
<%@page import="test.vo.FileinfoVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
</head>
<body>
<%
	int num =Integer.parseInt(request.getParameter("num"));
	String file =request.getParameter("file");
	FileinfoDao dao =new FileinfoDao();
	FileinfoVo vo =dao.getList(num);
%>

<h1>게시글 수정하기</h1>
<form method="post" action="update.jsp" enctype="multipart/form-data">
	작성자<br>
	<input type="text" name="writer" value="<%=vo.getWriter() %>"><br>
	제목<br>
	<input type="text" name="title" value="<%=vo.getTitle() %>"><br>
	내용<br>
	<textarea rows="5" cols="50" name="content"><%=vo.getContent() %></textarea><br>
	원본 이미지<br>
	<img src="upload/<%=file %>" style="width:100px;"><br>
	<input type="file" name="file1"><br>
	<input type="hidden" name="filenum" value="<%=vo.getFilenum() %>">
	<input type="submit" value="등록">&nbsp;<a href="delete.jsp?num=<%=vo.getFilenum()%>"><input type="button" value="삭제"></a>
</form>
</body>
</html>