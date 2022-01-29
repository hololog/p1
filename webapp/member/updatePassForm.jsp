<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updatePassForm.jsp</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<!-- header-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- header-->
<!-- main contents -->
<%
	String id=(String)session.getAttribute("id");
	
	if(id==null){
		response.sendRedirect("../member/loginForm.jsp");	
	} 
%>
<div class="container mt-5">
	<h2>비밀번호 변경</h2>
	<form action="updatePassPro.jsp" method="post">
		<table class="table">
			<tr>
				<td><input type="text" name="id" value="<%=id %>" readonly></td>
			</tr>
			<tr>	
				<td><input type="password" name="pass" placeholder="현재 비밀번호" required></td>
			</tr>
			<tr>
				<td><input type="password" name="pass2" placeholder="새 비밀번호" required></td>
			</tr>
			<tr>
				<td><input type="password" name="pass3" placeholder="새 비밀번호 확인" required></td>
			</tr>
			<tr>
				<td><input type="submit" value="변경"></td>
			</tr>
		</table>
	</form>
</div>
<!-- main contents -->
<!-- footer -->
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>