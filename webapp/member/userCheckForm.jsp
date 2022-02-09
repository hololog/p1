<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/userCheckForm.jsp</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<!-- header-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- header-->
<!-- Password확인 -->
<%
String id=(String)session.getAttribute("sessionID");

if(id==null)
	response.sendRedirect("loginForm.jsp");		
%>
<div class="w3-container w3-padding-64 w3-grey w3-grayscale-min w3-xlarge">
	<div class="w3-content">
	<h1 class="w3-center w3-jumbo" style="margin-bottom:64px">비밀번호 재확인</h1>
		<p>회원의 정보를 보호하기 위해 비밀번호를 다시한번 확인합니다.</p>
		<form action="userCheckPro.jsp" method="post">
			<table class="table"> 
				<tr>
					<td><label for="id">아이디 :</label></td>
					<td><input type="text" name="id" id="id" value="<%=id %>" readonly></td>
				</tr>
				<tr>
					<td><label for="pass">비밀번호 :</label></td>
					<td><input type="password" name="pass" id="pass" placeholder="비밀번호" required></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="확인"></td>
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