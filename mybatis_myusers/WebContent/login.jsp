<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
  <h2>로그인 페이지</h2>
  <form action="<%=request.getContextPath() %>/window/login" method="post">
    <div class="form-group">
      <label for="id">ID:</label>
      <input type="text" class="form-control" id="id" placeholder="아이디를 입력해 주세요." name="id">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="패스워드를 입력해주세요." name="pwd">
    </div>
    <button type="submit" class="btn btn-default">로그인</button>
    <div id="loginBtn">
    	<a href="<%=request.getContextPath() %>/window/login?member=true"><button type="button" class="btn">회원 가입</button></a>
    </div>
  </form>
</div>
