<%@page import="test.dao.MembersDao"%>
<%@page import="test.vo.MembersVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
<jsp:useBean id="dao" class="test.dao.MembersDao"/>
<%
	ArrayList<MembersVo> list =new ArrayList<MembersVo>();
	list =dao.getList();
	
	for(MembersVo vo : list){
		out.print("회원번호 : " + vo.getNum() + "<br>");
		out.print("이름 : " + vo.getName() + "<br>");
		out.print("전화번호 : " + vo.getPhone() + "<br>");
		out.print("주소 : " + vo.getAddr() + "<br>");
		out.print("가입일 : " + vo.getRegdate() + "<br>");
		out.print("--------------------------<br>");
	}
%>
 --%>
 <h1>전체 회원 목록</h1>
<table border="1" width="500">
	<tr>
		<th>번호</th><th>이름</th><th>전화번호</th><th>주소</th><th>가입일</th><th>삭제</th><th>수정</th>
		<%
			MembersDao mdao =new MembersDao();
			ArrayList<MembersVo> alist =mdao.getList();
			for(MembersVo vo : alist){
				%>
				<tr>
					<td><%=vo.getNum() %></td>
					<td><%=vo.getName() %></td>
					<td><%=vo.getPhone() %></td>
					<td><%=vo.getAddr() %></td>
					<td><%=vo.getRegdate() %></td>
					<td><a href="delete.jsp?num=<%=vo.getNum() %>">삭제</a></td>
					<td><a href="update.jsp?num=<%=vo.getNum() %>">수정</a></td>
				</tr>
				<%
			}
		%>
</table>
<a href="main.jsp">메인</a>
</body>
</html>