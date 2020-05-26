<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 메인</title>
</head>
<body>
	<ul>
		<li><a href="${ pageContext.request.contextPath }/write.do">글쓰기</a></li>
		<li><a href="/list.do">목록보기</a></li>
	</ul>
</body>
</html>