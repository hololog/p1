<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/deletePro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bean" class="member.MemberDTO" ></jsp:useBean>
<jsp:setProperty property="id" name="bean" param="id"/>
<jsp:setProperty property="pass" name="bean" param="pass"/>
<%
MemberDAO mDAO=new MemberDAO();

if(mDAO.userCheck(bean)!=null){
	mDAO.deleteMember(bean);
	session.invalidate();
%>
	  <script type="text/javascript">
	  	alert("정상적으로 탈퇴처리 되었습니다.");
	  	location.href="loginForm.jsp";
	  </script>	
<%
} else {
%>
	  <script type="text/javascript">
	  	alert("입력정보 틀림");
	  	history.back();
	  </script>	
<%
}
%>
</body>
</html>