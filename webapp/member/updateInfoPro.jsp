<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>	
<jsp:useBean id="bean" class="member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updateInfoPro.jsp</title>
</head>
<body>
<%
MemberDAO mDAO=new MemberDAO();
mDAO.updateInfo(bean);
response.sendRedirect("memberInfo.jsp");
%>
</body>
</html>