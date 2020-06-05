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
<h1>글 수정하기</h1>
<c:forEach items="${ uplist }" var="uli">
<form method="post" action="<c:url value='/update'/>">
		<input type="hidden" name="num" value="${ uli.getNum() }"/>
		작성자 <br>
		<input type="text" name="writer" value="${ uli.getWriter() }"/><br>
		비밀번호 <br>
		<input type="password" name="pwd" value="${ uli.getPwd() }"/><br>
		제목 <br>
		<input type="text" name="title" ${ uli.getTitle() }/><br>
		내용 <br>
		<textarea name="content" cols="60" rows="5">${ uli.getContent() }</textarea><br>
		<input type="submit" value="등록" />
	</form>
</c:forEach>
</body>
</html>