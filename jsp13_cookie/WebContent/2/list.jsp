<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>판매제품목록</h1>
<ul>
	<li><a href="1.jsp">냉장고</a></li>
	<li><a href="2.jsp">TV</a></li>
	<li><a href="3.jsp">컴퓨터</a></li>
</ul>
<div>
	<h1>최근본상품</h1>
	<ul>
	<%
		Cookie[] cookies =request.getCookies();
		System.out.println(cookies);
		if(cookies!=null){
			for(Cookie cook : cookies){
				String cookieName =cook.getName();
				if(cookieName.startsWith("item")){
					String cookValue =cook.getValue();
					
					%>
						<li><%=cookValue %> <a href="deleteCookies.jsp?cname=<%=cookieName %>">삭제</a></li>
					<%
				}
			}
		}
	%>
	</ul>
</div>
</body>
</html>