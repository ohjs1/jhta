<%@page import="vo.BoardVo"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int num =Integer.parseInt(request.getParameter("num"));
	BoardDao dao =new BoardDao();
	BoardVo vo =new BoardVo();
	vo =dao.update(num);
%>
<form action="update_s.jsp" method="post">
	<table>
		<tr>
			<th>글번호 <input type="text" name="num" value="<%=num %>" readonly="readonly"></th>
		</tr>
		<tr>
			<th>글쓴이 <input type="text" name="writer" value="<%=vo.getWriter() %>"></th>
		</tr>
		<tr>
			<th>이메일 <input type="text" name="email" value="<%=vo.getEmail() %>"></th>
		</tr>
		<tr>
			<th>제목 <input type="text" name="title" value="<%=vo.getTitle() %>"></th>
		</tr>
		<tr>
			<th>내용 <textarea rows="15" cols="60" name="content"><%=vo.getContent() %></textarea></th>
		</tr>
		<tr>
			<th><input type="submit" value="전송"></th>
		</tr>
	</table>
</form>