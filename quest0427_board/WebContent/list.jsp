<%@page import="vo.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<table border="1" width="800px">
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>이메일</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성일</th>
	</tr>
<c:set var="list" value="${requestScope.list}"/>
<c:forEach var="list" items="${list}">
	<tr>
		<td>${list.getNum()}</td>	
		<td>${list.getWriter()}</td>
		<td>${list.getEmail()}</td>
		<td>${list.getTitle()}</td>
		<td>${list.getContent()}</td>
		<td>${list.getW_date()}</td>
		<td><a href="${ pageContext.request.contextPath }/delete.do?num=${list.getNum()}">글삭제하기</a></td>
		<td><a href="${ pageContext.request.contextPath }/update.do?num=${list.getNum()}">글수정하기</a></td>
	</tr>
</c:forEach>
</table>
<br>
<a href="${ pageContext.request.contextPath }/main.jsp">처음으로</a>
</body>
</html>