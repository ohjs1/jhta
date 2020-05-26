<%@page import="vo.BoardVo"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num =Integer.parseInt(request.getParameter("num"));
	BoardDao dao =new BoardDao();
	BoardVo vo =dao.getList(num);
%>

<table border="1" width="100%">
	<tr>
		<th>글번호</th>
		<th><%=vo.getNum() %></th>
	</tr>
	<tr>
		<th>작성자</th>
		<th><%=vo.getWriter() %></th>
	</tr>
	<tr>
		<th>이메일</th>
		<th><%=vo.getEmail() %></th>
	</tr>
	<tr>
		<th>제목</th>
		<th><%=vo.getTitle() %></th>
	</tr>
	<tr>
		<th>작성일</th>
		<th><%=vo.getW_date() %></th>
	</tr>
	<tr>
		<th>글내용</th>
		<th height="500px"><%=vo.getContent() %></th>
	</tr>
</table>
<br>
<a href="main.jsp?file=update.jsp?num=<%=vo.getNum() %>">글 수정</a>&nbsp;&nbsp;<a href="main.jsp?file=delete.jsp?num=<%=vo.getNum() %>">글 삭제</a>
