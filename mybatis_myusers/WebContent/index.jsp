<!DOCTYPE html>
<%@page import="value.object.MyusersVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String pagePath = (String)request.getAttribute("loginPage");
	String logined = (String)request.getAttribute("logined");
%>
<html lang="en">
<head>
  <title>Mymembers Table</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
    
    /* 회원가입 버튼  */
    #loginBtn {
    	float: right;
    }
    
    /* 회원탈퇴 버튼 */
    #MemberBtn {
    	float: right;
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="<%=request.getContextPath() %>/index.jsp">Home</a></li>
        <li><a href="<%=request.getContextPath() %>/member/myinfo">myInfo</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <c:choose>
      	<c:when test="${ logined == null }">
      		<li><a href="<%=request.getContextPath() %>/window/login?"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Login</a></li>
      	</c:when>
      	<c:otherwise>
      		<li><a href="<%=request.getContextPath() %>/window/logout?"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Logout</a></li>
      	</c:otherwise>
      </c:choose>
        
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
    <div class="col-sm-8 text-left">
    <c:choose>
    	<c:when test="<%=pagePath == null %>">
    		<%@ include file="/defaultText.jsp" %>
    	</c:when>
    	<c:otherwise>
    		<jsp:include page="<%=pagePath %>"/>
    	</c:otherwise>
    </c:choose>
    </div>
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
