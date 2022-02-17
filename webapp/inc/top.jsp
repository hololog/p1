<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=(String)session.getAttribute("sessionID");
String nick=(String)session.getAttribute("nick");
%>
<div>
  <header class="container-fluid p-4 bg-dark text-light">
    <div class="row d-felx flex-nowrap justify-content-between align-items-center border">
      <div class="col-4 p-3 display-6">
        <a class="link-secondary" onclick="sidebar_open()" style="text-decoration-line: none;">☰</a>
        <a class="link-secondary" href="#" aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24">
         	<title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
        </a>
      </div>
      <div class="col-4 text-center display-6">
        <a href="../main/main.jsp" style="text-decoration-line: none;">PIZZERIA LARDO</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
<% 
	if(id==null){
%>
        <a class="btn btn-sm btn-outline-secondary" href="../member/loginForm.jsp">Login</a> &nbsp;
        <a class="btn btn-sm btn-outline-secondary" href="../member/joinForm.jsp">Sign up</a>
<%
	} else {
%>		<%=nick %>님 &nbsp;
<%
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
</div>  
<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:20%;min-width:300px; padding:20px" id="mySidebar">
  <a href="javascript:void(0)" onclick="sidebar_close()" class="w3-bar-item w3-button" style="padding:20px">Close</a>
  <a href="../board/boardList.jsp" onclick="sidebar_close()" class="w3-bar-item w3-button" style="padding:20px">QnA</a>
  <a href="../review/reviewList.jsp" onclick="sidebar_close()" class="w3-bar-item w3-button" style="padding:20px">Review</a>
  <a href="../fileboard/fileList.jsp" onclick="sidebar_close()" class="w3-bar-item w3-button" style="padding:20px">Board</a>
  <a href="../main/contact.jsp" onclick="sidebar_close()" class="w3-bar-item w3-button" style="padding:20px">Contact</a>
</nav>
<!-- <nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:20%;min-width:300px; padding:20px" id="mySidebar"> -->
<!--   <a href="javascript:void(0)" onclick="sidebar_close()" class="w3-bar-item w3-button" style="padding:20px">Close</a> -->
<!--   <a href="../board/boardList.jsp" onclick="sidebar_close()" class="w3-bar-item w3-button" style="padding:20px">QnA</a> -->
<!--   <a href="../review/reviewList.jsp" onclick="sidebar_close()" class="w3-bar-item w3-button" style="padding:20px">Review</a> -->
<!--   <a href="../fileboard/fileList.jsp" onclick="sidebar_close()" class="w3-bar-item w3-button" style="padding:20px">Board</a> -->
<!--   <a href="../main/contact.jsp" onclick="sidebar_close()" class="w3-bar-item w3-button" style="padding:20px">Contact</a> -->
<!-- </nav> -->
<script>
// Script to open and close sidebar
function sidebar_open() {
  document.getElementById("mySidebar").style.display = "block";
}
 
function sidebar_close() {
  document.getElementById("mySidebar").style.display = "none";
}
</script>
