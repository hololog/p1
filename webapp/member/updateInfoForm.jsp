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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	//우편번호 api
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("extraAddress").value = extraAddr;
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("postcode").value = data.zonecode;
	            document.getElementById("address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
	}
</script>
</head>
<body>
<!-- header-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- header-->
<!-- Update Info -->
<%
String id=(String)session.getAttribute("sessionID");

if(id==null){
	response.sendRedirect("loginForm.jsp");	
} 

MemberDAO mDAO=new MemberDAO();
MemberDTO mDTO=mDAO.getUserInfo(id);
String[] arrAddr=mDTO.getAddress().split(",");
%>
<div class="w3-container w3-padding-64 w3-blue-grey w3-grayscale-min w3-xlarge">
	<div class="w3-content">
	<h1 class="w3-center w3-jumbo" style="margin-bottom:64px">Update Info</h1>
	<form action="updateInfoPro.jsp" method="post" name="updateForm" onsubmit="return checkValue()">
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
				<td><label for="address" class=""><em style="color:red">*</em> 주소</label></td>
				<td>
					<div>
						<input type="text" id="postcode" name="postcode" placeholder="<%=arrAddr[3] %>" readonly required>
						<input type="button" value="우편번호 찾기" onclick="execDaumPostcode()"><br>
						<input type="text" id="address" name="address" placeholder="<%=arrAddr[0] %>" readonly required><br>
						<input type="text" id="detailAddress"name="detailAddress" placeholder="<%=arrAddr[1] %>" required>
	 					<input type="text" id="extraAddress" name="extraAddress" placeholder="<%=arrAddr[2] %>">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="변경">
					<input type="button" value="취소" onclick="location.href='memberInfo.jsp'">
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>
<!-- <div class="container mt-5"> -->
<!-- 	<h2>회원정보 조회/수정</h2> -->
<!-- 	<form action="updateInfoPro.jsp" method="post"> -->
<!-- 	<p>회원의 정보를 보호하기 위해 비밀번호를 다시한번 확인합니다.</p> -->
<!-- 		<table class="table"> -->
<!-- 			<tr> -->
<!-- 				<td><label for="id"> 아이디</label></td> -->
<%-- 				<td><input type="text" name="id" id="id" value="<%=mDTO.getId() %>" readonly></td> --%>
<!-- 			</tr> -->
<!-- 			<tr>	 -->
<!-- 				<td><label for="nick"> 닉네임</label></td> -->
<%-- 				<td><input type="text" name="nick" id="nick" value="<%=mDTO.getNick() %>" required></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td><label for="name"> 이름</label></td> -->
<%-- 				<td><input type="text" name="name" id="name" value="<%=mDTO.getName() %>" required></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td><label for="email"> 이메일</label></td> -->
<%-- 				<td><input type="email" name="email" id="email" value="<%=mDTO.getEmail() %>" required></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td><label for="address">주소</label></td> -->
<%-- 				<td><input type="text" name="address" id="address" value="<%=mDTO.getAddress() %>" required></td> --%>
<!-- 			</tr> -->
<!-- 		<!-- 		<tr> --> -->
<!-- 		<!-- 			<td>프로필사진</td><td></td> --> -->
<!-- 		<!-- 		</tr> --> -->
<!-- 			<tr> -->
<!-- 				<td colspan="2"> -->
<!-- 					<input type="submit" value="변경"> -->
<!-- 					<input type="button" value="취소" onclick="location.href='memberInfo.jsp'"> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</form> -->
<!-- </div> -->

<!-- main contents -->
<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>