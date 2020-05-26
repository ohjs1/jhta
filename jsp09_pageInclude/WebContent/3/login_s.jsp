<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id =request.getParameter("id");
	String pw =request.getParameter("pw");
	
	if(id.equals("admin") && pw.equals("1234")){
		session.setAttribute("id", id);
		pageContext.forward("layout.jsp?file=main.jsp");
	} else {
		%>
			<script type="text/javascript">
				alert("잘못된 아이디 입력함");
				history.go(-1);
			</script>
		<%
	}
	
%>