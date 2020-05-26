<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<h1>글등록</h1>
<form method="post" action="insertOk.jsp">
	<!-- 답글인 경우 부모글에 대한 정보 보내기 -->
	<input type="hidden" name="num" value="${ param.num }">
	<input type="hidden" name="ref" value="${ param.ref }">
	<input type="hidden" name="lev" value="${ param.lev }">
	<input type="hidden" name="step" value="${ param.step }">
	작성자<br>
	<input type="text" name="writer"><br>
	제목<br>
	<input type="text" name="title"><br>
	내용<br>
	<textarea cols="50" rows="5" name="content"></textarea><br>
	<input type="submit" value="등록">
</form>
</body>
</html>