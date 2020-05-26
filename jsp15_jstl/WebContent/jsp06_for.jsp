<%@page import="java.util.ArrayList"%>
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
<% int[] a ={10,20,30,40,50}; %>
<c:set var="a" value="<%=a %>"/>
<%-- 배열이나 컬렉션객체(ArrayList, ...)등은 items속성을 사용하여 쉽게 요소를 꺼내욜수 있다. --%>
<c:forEach var="n" items="${ a }">
	${ n } &nbsp;
</c:forEach>
<br>
<c:forEach var="n" items="${ a }" varStatus="st"><%--상태값에대한 정보를 갖음 --%>
	${ st.index } : ${ n } &nbsp;
</c:forEach>
<br>
<%
	ArrayList<String> list =new ArrayList<String>();
	list.add("홍길동");
	list.add("이길동");
	list.add("김길동");
	request.setAttribute("list", list);
%>
<c:forEach var="name" items="${ requestScope.list }"><%--request.setAttribute("list", list); 꺼내오기 --%>
	${ name }&nbsp;
</c:forEach>
</body>
</html>