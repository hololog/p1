<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/deleteForm.jsp</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
<!--  -->
<script type="text/javascript">
// 	function del() {
// 		if(confirm("정말 삭제하시겠습니까?")==true){
// 			document.getElementById('deleteform').submit();
// 		} else {
// 			return;
// 		}
// 	}
    // 비밀번호 미입력시 경고창
    function checkValue(){
        if(!document.deleteform.pass.value){
            alert("비밀번호를 입력하지 않았습니다.");
            return false;
        }
    }
</script>
<!--  -->
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
<!-- main -->
<div class="container mt-5">
	<h2>회원탈퇴</h2>
	<form action="deletePro.jsp" method="post" name="deleteform" onsubmit="return checkValue()">
		<table class="table">
			<tr>
				<td><input type="text" name="id" value="<%=id %>" readonly></td>
			</tr>
			<tr>	
				<td><input type="password" name="pass" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td>
<!-- 					<input type="button" value="회원탈퇴" onclick="del()"> -->
					<input type="submit" value="회원탈퇴">
					<input type="button" value="취소" onclick="location.href='memberInfo.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
<!-- main -->
<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>