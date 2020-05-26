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
<c:set var="t" value="${ requestScope.updateList }"/>
<form action="${pageContext.request.contextPath}/update.do" method="post">
	<table>
		<tr>
			<th>글번호 <input type="text" name="num" value="${ t.getNum() }" readonly="readonly"></th>
		</tr>
		<tr>
			<th>글쓴이 <input type="text" name="writer" value="${ t.getWriter() }"></th>
		</tr>
		<tr>
			<th>이메일 <input type="text" name="email" value="${ t.getEmail() }"></th>
		</tr>
		<tr>
			<th>제목 <input type="text" name="title" value="${ t.getTitle() }"></th>
		</tr>
		<tr>
			<th>내용 <textarea rows="15" cols="60" name="content" >${ t.getContent() }</textarea></th>
		</tr>
		<tr>
			<th><input type="submit" value="전송"></th>
		</tr>
	</table>
</form>
</body>
</html>