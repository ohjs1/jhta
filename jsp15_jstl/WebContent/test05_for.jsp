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
<%-- 
<c:forEach var="변수명" begin="초기값" end="끝값" step="증가값">
	반복문장
</c:forEach>
--%>
<!-- 1부터 100까지 출력하기 step은 1씩증가할경우에는 생략가능-->
<c:forEach var="i" begin="1" end="100">
	${ i } &nbsp;
</c:forEach>
<br>
<!-- 1부터 100까지 합 구하기 -->
<c:forEach var="i" begin="1" end="100">
	<%--step이 1인경우는 생략가능 --%>
	<c:set var="sum" value="${ sum + i }"/>
</c:forEach>
1부터 100까지 합 : ${ sum }<br>

<!-- 1부터 100까지 짝수합 구하기 -->
<c:forEach var="i" begin="2" end="100" step="2">
	<%--step이 1인경우는 생략가능 --%>
	<c:set var="sum1" value="${ sum1 + i }"/>
</c:forEach>
1부터 100까지 짝수합 : ${ sum1 }<br>
<!-- jstl사용해서 2단부터 9단까지 출력하기
한단은 한줄에 출력해 보세요.
 -->
 <c:forEach var="i" begin="2" end="9">
 	${ i } 단
 	<c:forEach var="j" begin="1" end="9" >
 		${ i } * ${ j } = ${ i * j } &nbsp;
 	</c:forEach>
 	<br>
 </c:forEach>
</body>
</html>