<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
	
	if(id!=null){
		response.sendRedirect("../main/main.jsp");	
	} 
%>
<!-- header-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- logo -->
<!-- logo -->
<!-- header-->
<!-- main image -->
<!-- main image -->
<!-- main contents -->

<form action="loginPro.jsp" method="post">
<fieldset class="container">
	<legend>로그인</legend>
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
</fieldset>
</form>

<!-- main contents -->
<!-- footer -->
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>