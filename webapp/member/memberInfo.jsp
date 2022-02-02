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
	String id=(String)session.getAttribute("sessionID");
// 	String memberID=request.getParameter("id");

	if(id == null){
		response.sendRedirect("loginForm.jsp");		
	} 
// 	else if(id.equals("admin") && memberID!=null){
// 		id=memberID;
// 	} 
	MemberDAO mDAO=new MemberDAO();
	MemberDTO mDTO=mDAO.getUserInfo(id);	
%>
	<div class="container mt-3">
		<h3>회원정보</h3>
		<table class="table">
			<tr>
				<td>아이디</td>
				<td><%=mDTO.getId() %></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><%=mDTO.getNick() %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=mDTO.getName() %></td>
			</tr>
	<!-- 		<tr> -->
	<!-- 			<td>프로필사진</td><td></td> -->
	<!-- 		</tr> -->
			<tr>
				<td>이메일</td>
				<td><%=mDTO.getEmail() %></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><%=mDTO.getAddress() %></td>
			</tr>
			<tr>
				<td>가입일</td>
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
<!-- main contents -->
<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>