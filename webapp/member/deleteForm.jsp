<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/deleteForm.jsp</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
<!-- 프롬프트 -->
<script>
	function del() {
		if(confirm("정말 삭제하시겠습니까?")==true){
			document.getElementById('frm').submit();
		} else {
			return;
		}
	}
</script>
<!-- 프롬프트 -->
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
<!-- header-->
<!-- main -->
<div class="container mt-5">
	<h2>회원탈퇴</h2>
	<form action="deletePro.jsp" method="post" id="frm">
		<table class="table">
			<tr>
				<td><input type="text" name="id" value="<%=id %>" readonly></td>
			</tr>
			<tr>	
				<td><input type="password" name="pass" placeholder="비밀번호" required></td>
			</tr>
			<tr>
				<td><input type="button" value="회원탈퇴" onclick="del()">
					<input type="button" value="취소" onclick="location.href='memberInfo.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
<!-- main -->
<!-- footer -->
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>