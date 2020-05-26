<%@page import="java.io.File"%>
<%@page import="test.dao.FileinfoDao"%>
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
	int filenum =Integer.parseInt(request.getParameter("filenum"));
	String orgfilename =request.getParameter("orgfilename");
	FileinfoDao dao =new FileinfoDao();
	int n =dao.delete(filenum);
	String upload =application.getRealPath("/upload");
	
	if(n>0){
		System.out.println("파일삭제 성공!");
		File file =new File(upload + "/" + orgfilename);
		file.delete();
		response.sendRedirect("list.jsp");
	} else {
		System.out.println("파일삭제 실패!");
	}
%>
</body>
</html>