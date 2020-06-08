<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
  <h2>모든 유저 정보</h2>
   <form action="<%=request.getContextPath() %>/search" method="post">
    <div class="input-group">
      <input type="text" class="form-control" placeholder="Search" name="keyword">
      <div class="input-group-btn">
        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
      </div>
    </div>
    <label class="checkbox-inline">
      <input type="checkbox" value="id" name="id">아이디
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" value="email" name="email">이메일
    </label>
  </form><br><br>
<br><br>
  <table class="table">
    <thead>
      <tr>
        <th>ID</th>
        <th>EMAIL</th>
        <th>MYDATE</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${ userlistALL }" var="ulist">
      <tr>
        <td>${ ulist.getId() }</td>
        <td>${ ulist.getEmail() }</td>
        <td>${ ulist.getMydate() }</td>
      </tr>      
      </c:forEach>
    </tbody>
  </table>
</div>