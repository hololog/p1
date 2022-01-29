<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/memberInfo.jsp</title>
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
	MemberDAO mDAO=new MemberDAO();
	
	if(id==null){
		response.sendRedirect("loginForm.jsp");		
		
	} else {
		MemberDTO mDTO=mDAO.getUserInfo(id);	
	
%>
	<div class="container mt-3">
		<h3>회원정보</h3>
		<table class="table">
			<tr>
				<td><label for="id"> 아이디</label></td>
				<td><%=mDTO.getId() %></td>
			</tr>
			<tr>
				<td><label for="nick"> 닉네임</label></td>
				<td><%=mDTO.getNick() %></td>
			</tr>
			<tr>
				<td><label for="name"> 이름</label></td>
				<td><%=mDTO.getName() %></td>
			</tr>
	<!-- 		<tr> -->
	<!-- 			<td>프로필사진</td><td></td> -->
	<!-- 		</tr> -->
			<tr>
				<td><label for="email"> 이메일</label></td>
				<td><%=mDTO.getEmail() %></td>
			</tr>
			<tr>
				<td><label for="address">주소</label></td>
				<td><%=mDTO.getAddress() %></td>
			</tr>
			<tr>
				<td><label for="join_date">가입일</label></td>
				<td><%=mDTO.getJoinDate() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="회원정보 변경" onclick="location.href='userCheckForm.jsp'">
					<input type="button" value="비빌번호 변경" onclick="location.href='updatePassForm.jsp'">
					<input type="button" value="탈퇴" onclick="location.href='deleteForm.jsp'">
				</td>
			</tr>
		</table>
	
	</div>
<% }%>
<!-- main contents -->
<!-- footer -->
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>