<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bv" class="vo.BoardVo"/>
<jsp:setProperty property="*" name="bv"/>
<jsp:useBean id="db" class="dao.BoardDao"/>
<%
	int n=db.insertBoard(bv);

	if(n>0){
		System.out.println("글작성 성공!");
		response.sendRedirect("main.jsp?file=list.jsp");
	} else {
		System.out.println("글작성 실패!");
		out.write("글작성 실패");
	}
%>