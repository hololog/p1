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
<!-- main contents -->
<%
	String id=(String)session.getAttribute("id");
	
	if(id==null)
		response.sendRedirect("../member/login.jsp");		
%>
<div>
	<h2>비밀번호 재확인</h2>
	<form action="userCheckPro.jsp" method="post">
	<p>회원의 정보를 보호하기 위해 비밀번호를 다시한번 확인합니다.</p>
		<div>
			<label for="id"> 아이디</label>
			<input type="text" name="id" id="id" value="<%=id %>" readonly>
		</div>
		<div>
			<label for="pass">비밀번호</label>
			<input type="password" name="pass" id="pass" placeholder="비밀번호" required>
		</div>
		<input type="submit" value="확인">
	</form>
</div>
<!-- main contents -->
<!-- footer -->
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>