<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/joinForm.jsp</title>
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
    // 비밀번호확인 불일치시 경고창
    function checkValue() {
    	
		if(document.getElementById('pass').value != document.getElementById('pass2').value){
			alert("동일한 비밀번호를 입력해주세요");
			return false;
		}
	}
    //아이디 중복체크
    function idCheck(){
    	if(document.joinForm.id.value=="" || document.joinForm.id.length < 0){
    		alert("먼저 아이디를 입력해주세요")
    		document.joinForm.id.focus();
    	} 
    	else {
    		window.open("idCheck.jsp?id="+document.joinForm.id.value,"","width=500, height=300, left=200,top=200");
    	}
    }
</script>
</head>
<body>
<%
String id=(String)session.getAttribute("sessionID");
	
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
	<form action="joinPro.jsp" method="post" name="joinForm" onsubmit="return checkValue()">
		<table class="table">
			<tr>
				<td><label for="id" class=""><em style="color:red">*</em> 아이디</label></td>
				<td>
					<input type="text" name="id" id="id" required>
					<input type="button" value="중복확인" onclick="idCheck()">
					<input type="hidden" name="idDuplication" value="unchecked">
				</td>
			</tr>
			<tr>
				<td><label for="pass" class=""><em style="color:red">*</em> 비밀번호</label></td>
				<td><input type="password" name="pass" id="pass" required></td>
			</tr>
			<tr>
				<td><label for="pass2" class=""><em style="color:red">*</em> 비밀번호 확인</label></td>
				<td><input type="password" name="pass2" id="pass2" required></td>
			</tr>
			<tr>
				<td><label for="name" class=""><em style="color:red">*</em> 이름</label></td>
				<td><input type="text" name="name" id="name" required></td>
			</tr>
			<tr>
				<td><label for="nick" class=""><em style="color:red">*</em> 닉네임</label></td>
				<td><input type="text" name="nick" id="nick" required></td>
			</tr>
			<tr>
				<td><label for="email" class=""><em style="color:red">*</em> 이메일</label></td>
				<td><input type="email" name="email" id="email" required></td>
			</tr>
			<tr>
				<td><label for="address" class=""><em style="color:red">*</em> 주소</label></td>
				<td>
					<div>
						<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly required>
						<input type="button" value="우편번호 찾기" onclick="execDaumPostcode()"><br>
						<input type="text" id="address" name="address" placeholder="주소" readonly required><br>
						<input type="text" id="detailAddress"name="detailAddress" placeholder="상세주소" required>
	 					<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="가입">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</section>

<!-- main contents -->
<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>