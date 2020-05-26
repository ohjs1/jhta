<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
	<li><a href="${ cp }/home">홈으로</a></li>
	<li><a href="${ cp }/board/write">글작성</a></li>
	<li><a href="${ cp }/board/list">글목록</a></li>
</ul>
<h1>게시판</h1>

<table border="2" width="800">
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>제목</th>
	</tr>
	<c:forEach var="list" items="${ list }">
		<tr>
			<td>${ list.getNum() }</td>
			<td>${ list.getWriter() }</td>
			<td><a href="${ cp }/board/detail?num=${list.getNum()}">${ list.getTitle() }</a></td>
		</tr>
	</c:forEach>
</table>
<!-- 페이징 처리 -->
<c:if test="${ startPageNum > 4 }">
	<a href="${ cp }/board/list?pageNum=${startPageNum-1}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${ startPageNum }" end="${ endPageNum }">
	<c:choose>
		<c:when test="${ i==pageNum }">
			<a href="${ cp }/board/list?pageNum=${i}"><span style="color:blue">[${ i }]</span></a>
		</c:when>
		
		<c:otherwise>
			<a href="${ cp }/board/list?pageNum=${i}"><span style="color:gray">[${ i }]</span></a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${ pageCount > endPageNum }">
	<a href="${ cp }/board/list?pageNum=${endPageNum+1}">[다음]</a>
</c:if>
<br><br>

<form action="${ cp }/board/search" method="post">
<input type="hidden" name="pageNum" value="${ pageNum }"/>
<select name="op">
	<option value="writer">작성자</option>
	<option value="num">글번호</option>
	<option value="title">제목</option>
</select>
<input type="text" name="keyword"/><input type="submit" value="검색" />
</form>
</body>
</html>