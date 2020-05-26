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
<c:set var="t" value="${ requestScope.resultDelete }"/>
<c:choose>
	<c:when test="${t>0}">
		${ t } 개의 글 삭제완료
	</c:when>
	<c:otherwise>
		글삭제 실패!
	</c:otherwise>
</c:choose>
<br>
<a href="${ pageContext.request.contextPath }/list.do">목록보기</a>
</body>
</html>