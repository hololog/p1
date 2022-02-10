<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/joinPro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>	
<jsp:useBean id="bean" class="member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<%
MemberDAO mDAO=new MemberDAO();
// DB채우기용
// for(int i=5;i<120;i++){
// 	bean.setId("AAA"+i);
// 	bean.setName("김길동"+i);
// 	bean.setNick("kildong"+i);
// 	bean.setEmail(i+"hong@gmail.com");
// 	mDAO.insertMember(bean);
// }
mDAO.insertMember(bean);
	
response.sendRedirect("loginForm.jsp");
%>
</body>
</html>