<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id =(String)session.getAttribute("id");
	String value ="";
	String filepath ="";
	
	if(id == null){
		value ="로그인";
		filepath ="login.jsp";
	} else {
		value ="로그아웃";
		filepath ="logout.jsp";
	}
%> 
<ul>
	<li><a href="layout.jsp?file=main.jsp">홈으로</a></li>
	<li><a href="layout.jsp?file=1.jsp">학원소개</a></li>
	<li><a href="layout.jsp?file=2.jsp">교육센터</a></li>
	<li><a href="layout.jsp?file=3.jsp">과정소개</a></li>
	<li><a href="layout.jsp?file=4.jsp">QNA</a></li>
	<li><a href="layout.jsp?file=<%=filepath %>"><%=value %></a></li>
</ul>