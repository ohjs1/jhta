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
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String birth = request.getParameter("birth");
	String addr = request.getParameter("addr"); //선택된 라디오 버튼 값
%>
<h1>사용자 정보</h1>
아이디 : <%=id %><br>
비밀번호 : <%=pwd %><br>
생년월일 : <%=birth %><br>
사는지역 : <%=addr %><br>

<%
	String[] hobby = request.getParameterValues("hobby");
	String job = request.getParameter("job");
	//선택된 취미 읽어오기(체크박스-배열)
	for(String h : hobby){
%>
	<%=h %><br> &nbsp; &nbsp;
<%
	}
%>

<%
	String desc = request.getParameter("desc");
%>
	직업 = <%= job %> <br>
	기타하고싶은 말 = <%= desc %>
</body>
</html>