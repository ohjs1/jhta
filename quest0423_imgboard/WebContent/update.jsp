<%@page import="test.dao.FileinfoDao"%>
<%@page import="test.vo.FileinfoVo"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String upload =application.getRealPath("/upload");
	MultipartRequest multi =new MultipartRequest(request, upload, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
	String writer =multi.getParameter("writer");
	String title =multi.getParameter("title");
	String content =multi.getParameter("content");
	String orgfilename =multi.getOriginalFileName("file1"); //전송된 파일명
	String savefilename =multi.getFilesystemName("file1"); //저장된 파일명
	int filenum =Integer.parseInt(multi.getParameter("filenum"));
	
	File file =new File(upload + "/" + savefilename);
	long filesize =file.length();
	//int filenum, String writer, String title, String content, String orgfilename, String savefilename, long filesize
	FileinfoVo vo =new FileinfoVo(filenum, writer, title, content, orgfilename, savefilename, filesize);
	FileinfoDao dao =new FileinfoDao();
	int n =dao.update(vo);
	 
	if(n>0){
		System.out.println("게시글 수정 성공!");
		response.sendRedirect("list.jsp");
	} else {
		System.out.println("게시글 수정 실패!");
	}
%>