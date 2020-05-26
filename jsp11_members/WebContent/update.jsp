<%@page import="test.vo.MembersVo"%>
<%@page import="test.dao.MembersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	int num =Integer.parseInt(request.getParameter("num"));
	MembersDao dao =new MembersDao();
	MembersVo vo =dao.getList(num);
%>
<form action="updateOk.jsp" method="post">
	회원번호 <input type="text" name="num" value="<%=vo.getNum() %>" readonly="readonly"><br>
	이름 <input type="text" name="name" value="<%=vo.getName() %>"><br>
	전화번호 <input type="text" name="phone" value="<%=vo.getPhone() %>"><br>
	주소<input type="text" name="addr" value="<%=vo.getAddr() %>"><br>
	<input type="submit" value="수정 완료">
</form>
</body>
</html>