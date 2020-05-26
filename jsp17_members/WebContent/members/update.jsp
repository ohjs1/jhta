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
<form action="${ pageContext.request.contextPath }/members/update.do" method="post">
	회원번호 <input type="text" name="num" value="${ param.num }" readonly="readonly"><br>
	이름 <input type="text" name="name" value="${ param.name }"><br>
	전화번호 <input type="text" name="phone" value="${ param.phone }"><br>
	주소<input type="text" name="addr" value="${ param.addr }"><br>
	<input type="submit" value="수정완료">
</form>
</body>
</html>