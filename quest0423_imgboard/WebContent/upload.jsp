<%@page import="test.dao.FileinfoDao"%>
<%@page import="java.io.File"%>
<%@page import="test.vo.FileinfoVo"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String upload =application.getRealPath("/upload");
	MultipartRequest multi =new MultipartRequest(request, upload, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
	String writer =multi.getParameter("writer");
	String title =multi.getParameter("title");
	String content =multi.getParameter("content");
	String orgfilename =multi.getOriginalFileName("file1"); //전송된 파일명
	String savefilename =multi.getFilesystemName("file1"); //저장된 파일명
	
	File file =new File(upload + "/" + savefilename);
	long filesize =file.length();
	//int filenum, String writer, String title, String content, String orgfilename, String savefilename, long filesize
	FileinfoVo vo =new FileinfoVo(0, writer, title, content, orgfilename, savefilename, filesize);
	FileinfoDao dao =new FileinfoDao();
	int n =dao.insert(vo);
	
	if(n>0){
		System.out.println("게시글 작성 성공!");
		response.sendRedirect("list.jsp");
	} else {
		System.out.println("게시글 작성 실패!");
	}
%>
