<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updateInfoForm.jsp</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<!-- header-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- header-->
<!-- main contents -->
<%
	String id=(String)session.getAttribute("sessionID");
	MemberDAO mDAO=new MemberDAO();
	
	if(id==null){
		response.sendRedirect("loginForm.jsp");	
	} else {
		MemberDTO mDTO=mDAO.getUserInfo(id);	
%>
<div class="container mt-5">
	<h2>회원정보 조회/수정</h2>
	<form action="updateInfoPro.jsp" method="post">
	<p>회원의 정보를 보호하기 위해 비밀번호를 다시한번 확인합니다.</p>
		<table class="table">
			<tr>
				<td><label for="id"> 아이디</label></td>
				<td><input type="text" name="id" id="id" value="<%=mDTO.getId() %>" readonly></td>
			</tr>
			<tr>	
				<td><label for="nick"> 닉네임</label></td>
				<td><input type="text" name="nick" id="nick" value="<%=mDTO.getNick() %>" required></td>
			</tr>
			<tr>
				<td><label for="name"> 이름</label></td>
				<td><input type="text" name="name" id="name" value="<%=mDTO.getName() %>" required></td>
			</tr>
			<tr>
				<td><label for="email"> 이메일</label></td>
				<td><input type="email" name="email" id="email" value="<%=mDTO.getEmail() %>" required></td>
			</tr>
			<tr>
				<td><label for="address">주소</label></td>
				<td><input type="text" name="address" id="address" value="<%=mDTO.getAddress() %>" required></td>
			</tr>
		<!-- 		<tr> -->
		<!-- 			<td>프로필사진</td><td></td> -->
		<!-- 		</tr> -->
			<tr>
				<td colspan="2">
					<input type="submit" value="변경">
					<input type="button" value="취소" onclick="location.href='memberInfo.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%} %>
<!-- main contents -->
<!-- footer -->
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>