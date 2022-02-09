<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login.jsp</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<%
	String id=(String)session.getAttribute("sessionID");
	
	if(id!=null){
		response.sendRedirect("../main/main.jsp");	
	} 
%>
<!-- header-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- header-->
<!-- login -->
<div class="w3-container w3-padding-64 w3-grey w3-grayscale-min w3-xlarge">
	<div class="w3-content">
	<h1 class="w3-center w3-jumbo" style="margin-bottom:64px">Login</h1>
	<form action="loginPro.jsp" method="post">
	<table class="table"> 
		<tr>
			<td><label for="id">아이디 :</label></td>
			<td><input type="text" name="id" id="id" required></td>
		</tr>
		<tr>
			<td><label for="pass">비밀번호 :</label></td>
			<td><input type="password" name="pass" id="pass" required></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="로그인"></td>
		</tr>
	</table>
	</form>
	</div>
</div>
<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>