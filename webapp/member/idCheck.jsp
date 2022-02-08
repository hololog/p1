<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");

MemberDAO mDAO = new MemberDAO();
MemberDTO mDTO = mDAO.getUserInfo(id);
if(mDTO==null){
	out.print("사용가능한 아이디입니다");
	%>
	 <input type="button" value="아이디 사용하기" onclick="result();">
	<%
} else {
	out.print("중복된 아이디입니다");
}
%>
<!-- 팝업창  -->
<div>
	<form action="idCheck.jsp" method="post" name="fr">
		ID : <input type="text" name="id" value="<%=id%>">
		<input type="submit" value="중복 확인">	 
	</form>
</div>

<script type="text/javascript">
    function result(){
    	//회원가입페이지의 id값에 아이디중복으로 선택된 id값을 대입.
    	opener.document.joinForm.id.value = document.fr.id.value;
    	//회원가입창 제어
    	opener.document.joinForm.id.readOnly=true;
    	window.close();
    }
</script>  
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>  
</body>
</html>