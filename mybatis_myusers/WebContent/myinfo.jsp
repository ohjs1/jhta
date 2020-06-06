<%@page import="value.object.MyusersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MyusersVO vo = (MyusersVO)request.getAttribute("myinfo"); 
	//System.out.println(vo.getEmail() + " :  myinfo vo");
%>
<div class="container">
  <h2>회원 정보 수정</h2>
  <form action="<%=request.getContextPath() %>/member/join/update" method="post">
  	<input type="hidden" name="mydate" value="<%=vo.getMydate() %>" />
    <div class="form-group">
      <label for="id">아이디:</label>
      <input type="text" class="form-control" id="id" placeholder="아이디를 입력해주세요." name="id" value="<%=vo.getId() %>" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="패스워드를 입력해주세요." name="pwd" value="<%=vo.getPw()%>">
    </div>
    <div class="form-group">
      <label for="email">이메일:</label>
      <input type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요." name="email" value="<%=vo.getEmail() %>">
    </div>
    <button type="submit" class="btn btn-default">회원 정보 수정</button>
    <div id="MemberBtn">
    	<a href="<%=request.getContextPath() %>/member/del?id=<%=vo.getId() %>"><button type="button" class="btn">회원 탈퇴</button></a>
    </div>
  </form>
</div>