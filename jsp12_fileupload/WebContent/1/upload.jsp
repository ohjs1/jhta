<%@page import="test.vo.FileinfoVo"%>
<%@page import="test.dao.FileinfoDao"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
	String upload =application.getRealPath("/upload");
	System.out.println(upload);
	//MultipartRequest(javax.servlet.http.HttpServletRequest request, java.lang.String saveDirectory, 
			//int maxPostSize, java.lang.String encoding, FileRenamePolicy policy)
	
	MultipartRequest mr =new MultipartRequest(request, upload, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
	String writer =mr.getParameter("writer");
	String title =mr.getParameter("title");
	String content =mr.getParameter("content");
	String orgfilename =mr.getOriginalFileName("file1"); //전송된 파일명
	String savefilename =mr.getFilesystemName("file1"); //저장된 파일명
	File file1 =mr.getFile("file1");
	long filesize =file1.length(); //전송된파일의 크기 얻어오기
	
	FileinfoDao dao =new FileinfoDao();
	FileinfoVo vo =new FileinfoVo(0, writer, title, content, orgfilename, savefilename, filesize);

	int n =dao.insert(vo);
	
	if(n>0){
		out.write("저장성공!");
	} else {
		out.write("저장실패!");
	}
%>
	<p>[<%=upload %>]경로에 파일 업로드 완료</p>
	<h1>전송된 정보</h1>
	작성자 : <%=writer %><br>
	제목 : <%=title %><br>
	내용 : <%=writer %><br>
	전송된파일명 : <%=orgfilename %><br>
	저장된파일명 : <%=savefilename %><br>
</body>
</html>