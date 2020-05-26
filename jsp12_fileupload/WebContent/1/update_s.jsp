<%@page import="test.dao.FileinfoDao"%>
<%@page import="test.vo.FileinfoVo"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	FileinfoDao dao =new FileinfoDao();

	//파일 제거
	String upload =application.getRealPath("/upload");
	MultipartRequest mr =new MultipartRequest(request, upload, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
	
	String savefilename =mr.getParameter("savefilename");
	int filenum =Integer.parseInt(mr.getParameter("filenum"));
	
	File orgFile =new File(upload + "/" + savefilename); 	
	
	
	//파일 업로드
	String orgfilename2 =mr.getOriginalFileName("file1"); //전송된 파일명
	String savefilename2 =mr.getFilesystemName("file1"); //저장된 파일명
	
	String writer =mr.getParameter("writer");
	String title =mr.getParameter("title");
	String content =mr.getParameter("content");
	
	File upfile =new File(upload + "/" + savefilename2);
	long filesize =upfile.length();
	
	FileinfoVo vo2 =dao.getList(filenum);
	
	if(orgfilename2 != null){
		FileinfoVo vo =new FileinfoVo(filenum, writer, title, content, orgfilename2, savefilename2, filesize);
		int n =dao.update(vo);
		orgFile.delete();
		
		if(n>0){ 
			System.out.println("파일 업로드 완료!");
			response.sendRedirect("list.jsp");
		} else {
			System.out.println("파일업로드 실패!");
		}
	} else {
		FileinfoVo vo =new FileinfoVo(filenum, writer, title, content, vo2.getSavafilename(),
				vo2.getSavafilename(), vo2.getFilesize());
		int n =dao.update(vo);
		if(n>0){ 
			System.out.println("파일 업로드 완료!");
			response.sendRedirect("list.jsp");
		} else {
			System.out.println("파일업로드 실패!");
		}
	}
	
%>
</body>
</html> 