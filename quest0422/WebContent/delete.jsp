<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num =Integer.parseInt(request.getParameter("num"));
	System.out.println(num);
	BoardDao dao =new BoardDao();
	int n =dao.delete(num);
	
	if(n>0){
		System.out.println("글삭제 성공!");
		%>
		<script type="text/javascript">
			alert("글삭제 완료!");
			location.href="main.jsp";
		</script>
		<%
	} else {
		System.out.println("삭제 실패!");
		out.write("<p>삭제 실패</p>");
	}
%>