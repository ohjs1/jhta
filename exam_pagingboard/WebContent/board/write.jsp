<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 글작성하기</title>
</head>
<body>
<ul>
	<li><a href="${ cp }/home">홈으로</a></li>
	<li><a href="${ cp }/board/write">글작성</a></li>
	<li><a href="${ cp }/board/list">글목록</a></li>
</ul>
<h1>글 등록하기</h1>
<form action="${ cp }/board/write" method="post">
<table>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="writer"/></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" cols="30" rows="10"></textarea></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pwd"/></td>
	</tr>
</table>
	<input type="submit" value="등록" />
</form>
</body>
</html>