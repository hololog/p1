<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/joinForm.jsp</title>
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
<section class="container">
	<h3>회원가입</h3>
	<form action="joinPro.jsp" method="post">
		<div>
			<label for="id" class=""><em style="color:red">*</em> 아이디</label>
				<input type="text" name="id" id="id" required>
		</div>
		<div>
			<label for="pass" class=""><em style="color:red">*</em> 비밀번호</label>
				<input type="password" name="pass" id="pass" required>
				<p class="">비밀번호는 6자리 이상이어야 하며 영문과 숫자를 반드시 포함해야 합니다.</p>
		</div>
		<div>
			<label for="pass2" class=""><em style="color:red">*</em> 비밀번호 확인</label>
				<input type="password" name="pass2" id="pass2" required>
		</div>
		<div>
			<label for="name" class=""><em style="color:red">*</em> 이름</label>
				<input type="text" name="name" id="name" required>
		</div>
		<div>
			<label for="nick" class=""><em style="color:red">*</em> 닉네임</label>
				<input type="text" name="nick" id="nick" required>
		</div>
		<div>
			<label for="email" class=""><em style="color:red">*</em> 이메일</label>
				<input type="email" name="email" id="email" required>
		</div>
		<div>
			<label for="address" class=""><em style="color:red">*</em> 주소</label>
				<input type="text" name="address" id="address" required>
		</div>
		<input type="submit" value="가입">
		<input type="reset" value="취소">
	</form>
</section>
<!-- main contents -->
<!-- footer -->
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>