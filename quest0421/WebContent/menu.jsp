<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String login =(String)session.getAttribute("login");
	String path="";
	if(login==null){
		login ="로그인";
		path ="login.jsp";
	} else {
		login ="로그아웃";
		path ="logout.jsp";
	}
%>
<ul>
	<a href="main.jsp?file=write.jsp"><li>글쓰기</li></a>
	<a href="main.jsp?file=list.jsp"><li>글목록</li></a>
	<a href="main.jsp?file=join.jsp"><li>회원가입</li></a>
	<a href="main.jsp?file=<%=path %>"><li><%=login %></li></a>
</ul>