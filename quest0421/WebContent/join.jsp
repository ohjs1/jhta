<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="content">
	<form action="write_s.jsp" method="post">
		아이디 : <input type="text" name="id">&nbsp;&nbsp;<input type="button" value="중복확인"><br><br>
		비밀번호 : <input type="password" name="pw"><br><br>
		이메일 : <input type="text" name="email"><br><br>
		글제목 : <input type="text" name="title"><br><br>
		글내용 : <textarea rows="10" cols="60" name="content"></textarea><br><br>
		<input type="submit" value="전송">
	</form>
</div>