<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul>
	<li><a href="main.jsp?file=write.jsp">글 등록</a></li>
	<li><a href="main.jsp?file=list.jsp">전체 게시글 보기</a></li>
</ul>
<form action="main.jsp?file=search.jsp" method="post">
게시물 검색<input type="text" name="keyword"><input type="submit" value="검색">
</form>