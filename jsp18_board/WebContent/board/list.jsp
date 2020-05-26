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
<table border="1" width="500">
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>제목</th>
	</tr>
	<c:forEach var="vo" items="${ list }">
		<tr>
			<td>${ vo.num }</td>
			<td>${ vo.writer }</td>
			<td>
			<c:if test="${ vo.lev>0 }">
				<c:forEach var="i" begin="1" end="${ vo.lev }">
					&nbsp;&nbsp;
				</c:forEach>
				[re]
			</c:if>
			<a href="${ cp }/board/detail.do?num=${vo.num}">${ vo.title }</a>
			</td>
		</tr>
	</c:forEach>
</table>
<br>
<!-- 페이징 처리 -->
<c:if test="${ startPageNum > 10 }">
	<a href="${ cp }/board/list.do?pageNum=${startPageNum-1}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${ startPageNum }" end="${ endPageNum }">
	<c:choose>
		<c:when test="${ i==pageNum }">
			<a href="${ cp }/board/list.do?pageNum=${i}"><span style="color:blue">[${ i }]</span></a>
		</c:when>
		
		<c:otherwise>
			<a href="${ cp }/board/list.do?pageNum=${i}"><span style="color:gray">[${ i }]</span></a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${ pageCount > endPageNum }">
	<a href="${ cp }/board/list.do?pageNum=${endPageNum+1}">[다음]</a>
</c:if>
</body>
</html>