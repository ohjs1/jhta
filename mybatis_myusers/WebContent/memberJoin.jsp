<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
  <h2>회원 가입</h2>
  <form action="<%=request.getContextPath() %>/member/join" method="post">
    <div class="form-group">
      <label for="id">아이디:</label>
      <input type="text" class="form-control" id="id" placeholder="아이디를 입력해주세요." name="id">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="패스워드를 입력해주세요." name="pwd">
    </div>
    <div class="form-group">
      <label for="email">이메일:</label>
      <input type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요." name="email">
    </div>
    <button type="submit" class="btn btn-default">회원가입</button>
  </form>
</div>