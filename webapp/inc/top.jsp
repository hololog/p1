<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
	String id=(String)session.getAttribute("id");
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Disabled</a>
        </li>
      </ul>
    </div>

<% 
	if(id!=null){
%>
	    <div>
		    <a href="../member/logoutPro.jsp">로그아웃</a> |
		    <a href="../member/memberInfo.jsp">회원정보</a>
	    </div>
	    <div class=""></div>
<%
	} else {
%>	    
		<div>
		    <a href="../member/loginForm.jsp">로그인</a> |
		    <a href="../member/joinForm.jsp">회원가입</a>
	    </div>
	    <div class=""></div>
<%		
	}
%>
  </div>  
</nav>
</header>
