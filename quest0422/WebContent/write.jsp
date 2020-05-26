<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<form action="write_s.jsp" method="post">
	<table>
		<tr>
			<th>글쓴이 <input type="text" name="writer"></th>
		</tr>
		<tr>
			<th>이메일 <input type="text" name="email"></th>
		</tr>
		<tr>
			<th>제목 <input type="text" name="title"></th>
		</tr>
		<tr>
			<th>내용 <textarea rows="15" cols="60" name="content"></textarea></th>
		</tr>
		<tr>
			<th><input type="submit" value="전송"></th>
		</tr>
	</table>
</form>