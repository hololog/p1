<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/deleteForm.jsp</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
<script type="text/javascript">
	function del() {
		if(confirm("정말 삭제하시겠습니까?") == true){
			document.getElementById('deleteform').submit();
		} else {
			return;
		}
	}
</script>
</head>
<body>
<%
String id=(String)session.getAttribute("sessionID");

if(id==null){
	response.sendRedirect("loginForm.jsp");	
} 
%>
<!-- header-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- header-->
<!-- delete -->
<div class="w3-container w3-padding-64 w3-grey w3-grayscale-min w3-xlarge">
	<div class="w3-content">
	<h1 class="w3-center w3-jumbo" style="margin-bottom:64px">Withdrawal</h1>
		<form action="deletePro.jsp" method="post" id="deleteform">
			<table class="table">
				<tr>
					<td><input type="text" name="id" value="<%=id %>" readonly></td>
				</tr>
				<tr>	
					<td><input type="password" name="pass" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td>
						<input type="button" value="회원탈퇴" onclick="del()">
						<input type="button" value="취소" onclick="location.href='memberInfo.jsp'">
					</td>
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