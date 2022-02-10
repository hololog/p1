<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/userCheckPro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>	
<jsp:useBean id="bean" class="member.MemberDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<%
MemberDAO mDAO=new MemberDAO();
bean=mDAO.userCheck(bean);

if(bean!=null){
	response.sendRedirect("updateInfoForm.jsp");	
} else {
%>
	<script type="text/javascript">
		alert("비밀번호를 다시확인해주세요.");
		history.back();
	</script>		
<%	}%>
</body>
</html>