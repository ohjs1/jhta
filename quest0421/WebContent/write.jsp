<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="write_s.jsp" method="post">
	작성자 : <input type="text" name="writer"><br><br>
	이메일 : <input type="text" name="email"><br><br>
	글제목 : <input type="text" name="title"><br><br>
	글내용 : <textarea rows="10" cols="60" name="content"></textarea><br><br>
	<input type="submit" value="전송">
</form>