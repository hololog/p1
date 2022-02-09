<%@page import="java.text.SimpleDateFormat"%>
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
<%
String id=(String)session.getAttribute("sessionID");

if(id == null){
	response.sendRedirect("loginForm.jsp");		
} 
MemberDAO mDAO=new MemberDAO();
MemberDTO mDTO=mDAO.getUserInfo(id);
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
%>
<!-- info -->
<div class="w3-container w3-padding-64 w3-red w3-grayscale w3-xlarge">
	<div class="w3-content">
	<h1 class="w3-center w3-jumbo" style="margin-bottom:64px">User Info</h1>
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
				<td><%=dateFormat.format(mDTO.getJoinDate())  %></td>
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
</div>
<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>