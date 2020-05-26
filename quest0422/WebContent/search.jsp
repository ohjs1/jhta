<%@page import="vo.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String keyword =request.getParameter("keyword");
	System.out.println(keyword);
	BoardDao dao =new BoardDao();
	ArrayList<BoardVo> list =dao.search(keyword);
%>
	<table border="1" width="100%">  
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>이메일</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
	<%
	for(BoardVo vo : list){
	%>
	<tr>
		<td><%=vo.getNum() %></td>
		<td><%=vo.getWriter() %></td>
		<td><%=vo.getEmail() %></td>
		<td><a href="main.jsp?file=boardDetail.jsp?num=<%=vo.getNum() %>"><%=vo.getTitle() %></a></td>
		<td><%=vo.getW_date() %></td>
	</tr>
	<%
	}
	 %>
		</table>