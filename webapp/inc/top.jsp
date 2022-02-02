<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <header class="blog-header"> -->
<%
	String id=(String)session.getAttribute("sessionID");
%>
<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">피자</a>
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
    </div> -->
<div class="container">
  <header class="py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
        <a class="link-secondary" href="#">Subscribe</a>
        <a class="link-secondary" href="#" aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
        </a>
      </div>
      <div class="col-4 text-center">
        <a class="logo" href="../main/main.jsp">피자</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
<% 
	if(id==null){
%>
        <a class="btn btn-sm btn-outline-secondary" href="../member/loginForm.jsp">Login</a> &nbsp;
        <a class="btn btn-sm btn-outline-secondary" href="../member/joinForm.jsp">Sign up</a>
<%
	} else {
		if(id.equals("admin")){
%>
 
        <a class="btn btn-sm btn-outline-secondary" href="../admin/memberList.jsp">회원목록</a> &nbsp;
<%      }%>
        <a class="btn btn-sm btn-outline-secondary" href="../member/memberInfo.jsp">회원정보</a> &nbsp;
        <a class="btn btn-sm btn-outline-secondary" href="../member/logoutPro.jsp">로그아웃</a>
<%  }%>
      </div>
    </div>	
  </header>
  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 link-secondary" href="#">메뉴</a>
      <a class="p-2 link-secondary" href="../review/reviewList.jsp">리뷰</a>
    </nav>
  </div>
</div>  

