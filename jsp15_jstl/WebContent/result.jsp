<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- prefix 문자로 시작됨 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>두수의 곱</h1>
${ param.n1 } * ${ param.n2 } = ${ param.n1*param.n2 }<br><!-- 자동형변환이 된다. -->

<h1>홀수짝수 판별</h1>
입력한 수 ${ param.num1 } 은 
<c:set var="num" value="${ param.num1 }"/>
<c:choose>
	<c:when test="${ num%2==0 }">
		짝수입니다.
	</c:when>
	<c:otherwise>
		홀수입니다.
	</c:otherwise>
</c:choose>
</body>
</html>