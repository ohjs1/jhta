<%@page import="test.vo.FileinfoVo"%>
<%@page import="test.dao.FileinfoDao"%>
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
	int filenum =Integer.parseInt(request.getParameter("filenum"));
	String savafilename =request.getParameter("savafilename");
	
	FileinfoDao dao =new FileinfoDao();
	FileinfoVo vo =dao.getList(filenum);
%>

<h1>파일 수정하기</h1>
<form method="post" action="update_s.jsp" enctype="multipart/form-data">
	파일번호<br>
	<input type="text" name="filenum" readonly="readonly" value="<%=vo.getFilenum() %>"><br>
	작성자<br>
	<input type="text" name="writer" value="<%=vo.getWriter() %>"><br>
	제목<br>
	<input type="text" name="title" value="<%=vo.getTitle() %>"><br>
	내용<br>
	<textarea rows="5" cols="50" name="content"><%=vo.getContent() %></textarea><br>
	첨부파일<br>
	
	<input type="hidden" name="savefilename" value="<%=vo.getSavafilename() %>"><br>
	원본 파일명<input type="text" value="<%=vo.getSavafilename() %>"><br>
	<input type="file" name="file1"><br>
	<input type="submit" value="등록">
</form>
</body>
</html>