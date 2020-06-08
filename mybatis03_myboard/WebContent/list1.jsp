<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${ pageContext.request.contextPath }/list1" method="post">
		<input type="checkbox" name="writer" checked="checked" value="writer" /> 작성자
		<input type="checkbox" name="title" value="title" /> 제목
		<input type="checkbox" name="content" value="content" /> 내용
		
		<input type="text" name="keyword" />
		<input type="submit" value="검색" />
	</form>
	<c:forEach items="${ list }" var="i">
		<hr>
		글번호 : ${ i.getNum() }<br>
		글제목 : ${ i.getTitle() }<br>
		작성자 : ${ i.getWriter() }<br>
		글내용: ${ i.getContent() }<br>
		비밀번호 : ${ i.getPwd() }<br>
		글내용 : ${ i.getContent() }<br>
		작성일 : ${ i.getRegdate() }<br>
		<a href="${ pageContext.request.contextPath }/delete?num=${ i.getNum() }">삭제</a><br>
		<a href="${ pageContext.request.contextPath }/update?num=${ i.getNum() }">수정</a>
		<hr>
	</c:forEach>

</body>
</html>