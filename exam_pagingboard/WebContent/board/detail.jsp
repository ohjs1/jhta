<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
</head>
<body>
	<ul>
		<li><a href="${ cp }/home">홈으로</a></li>
		<li><a href="${ cp }/board/write">글작성</a></li>
		<li><a href="${ cp }/board/list">글목록</a></li>
	</ul>
	<h1>상세글 보기</h1>
	<c:set var="vo" value="${ vo }" />
	글번호 : ${ vo.getNum() }
	<br> 작성자 : ${ vo.getWriter() }
	<br> 내용 :
	<textarea cols="30" rows="10" readonly="readonly">${ vo.getContent() }</textarea>
	<br>
	<br>
	<form action="${ cp }/board/delete" method="post">
		<input type="hidden" name="num" value="${ vo.getNum() }" />
		비밀번호 <input type="password" name="pwd" /><input type="submit" value="삭제" />${ err }
	</form>
</body>
</html>