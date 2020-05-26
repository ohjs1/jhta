<%@page import="java.util.ArrayList"%>
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
<table border="2" width="1200px">
<tr>
	<th>파일번호</th>
	<th>작성자</th>
	<th>제목</th>
	<th>원본파일명</th>
	<th>파일크기(byte)</th>
	<th>삭제</th>
	<th>수정</th>
	<th>이미지</th>
	<th>다운로드</th>
</tr>
<%
	FileinfoDao dao =new FileinfoDao();
	ArrayList<FileinfoVo> list =new ArrayList<FileinfoVo>();
	list =dao.getList();

	
	for(FileinfoVo vo : list){
		%>
		<tr>
			<th><%=vo.getFilenum() %></th>
			<th><%=vo.getWriter() %></th>
			<th><%=vo.getTitle() %></th>
			<th><%=vo.getOrgfilename() %></th>
			<th><%=vo.getFilesize() %></th>
			<th><a href="delete.jsp?filenum=<%=vo.getFilenum() %>&orgfilename=<%=vo.getOrgfilename() %>">삭제</a></th>
			<th><a href="update.jsp?filenum=<%=vo.getFilenum() %>&savafilename=<%=vo.getSavafilename() %>">수정</a></th>
			<th><img src="upload/<%=vo.getSavafilename() %>" style="width:250px"></th>
			<th><a href="filedownload?filenum=<%=vo.getFilenum() %>">파일 다운로드</a></th>
		</tr>
		<%
	}
%>
</table>
</body>
</html>