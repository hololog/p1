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
<%
String id=(String)session.getAttribute("sessionID");

if(id==null){
	response.sendRedirect("loginForm.jsp");	
} 
%>
<!-- update pass -->
<div class="w3-container w3-padding-64 w3-grey w3-grayscale-min w3-xlarge">
	<div class="w3-content">
	<h1 class="w3-center w3-jumbo" style="margin-bottom:64px">Update pass</h1>
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
</div>
<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>